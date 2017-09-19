//
//  PageboyControllerManagement.swift
//  Pageboy
//
//  Created by Merrick Sapsford on 13/02/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit

// MARK: - VC Reloading
public extension PageboyViewController {
    
    /// Reload the view controllers in the page view controller.
    /// This reloads the dataSource entirely, calling viewControllers(forPageboyViewController:)
    /// and defaultPageIndex(forPageboyViewController:).
    public func reloadPages() {
        self.reloadPages(reloadViewControllers: true)
    }
    
    /// Reload the currently active page into the page view controller if possible.
    /// Does not reload from dataSource.
    internal func reloadCurrentPageSoftly() {
        guard let currentIndex = self.currentIndex else { return }
        guard let currentViewController = self.viewControllers?[currentIndex] else { return }
        
        self.pageViewController?.setViewControllers([currentViewController], direction: .forward,
                                                    animated: false, completion: nil)
    }
}

// MARK: - Paging Set Up and Configuration
internal extension PageboyViewController {
    
    // MARK: Set Up
    
    /// Set up inner UIPageViewController ready for displaying pages.
    ///
    /// - Parameter reloadViewControllers: Reload the view controllers data source for the PageboyViewController.
    internal func setUpPageViewController(reloadViewControllers: Bool = true) {
        var existingZIndex: Int?
        if self.pageViewController != nil { // destroy existing page VC
            existingZIndex = self.view.subviews.index(of: self.pageViewController!.view)
            self.pageViewController?.view.removeFromSuperview()
            self.pageViewController?.removeFromParentViewController()
            self.pageViewController = nil
        }
        
        let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: self.navigationOrientation,
                                                      options: self.pageViewControllerOptions)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        self.pageViewController = pageViewController
        
        self.addChildViewController(pageViewController)
      
        if let existingZIndex = existingZIndex {
            self.view.insertSubview(pageViewController.view, at: existingZIndex)
        } else {
            self.view.addSubview(pageViewController.view)
            self.view.sendSubview(toBack: pageViewController.view)
        }
      
        pageViewController.view.pinToSuperviewEdges()
      
        pageViewController.scrollView?.delegate = self
        pageViewController.view.backgroundColor = .clear
        pageViewController.scrollView?.delaysContentTouches = delaysContentTouches
        pageViewController.scrollView?.isScrollEnabled = isScrollEnabled
        pageViewController.scrollView?.isUserInteractionEnabled = isUserInteractionEnabled
        
        self.reloadPages(reloadViewControllers: reloadViewControllers)
    }
    
    /// Reload the pages in the PageboyViewController
    ///
    /// - Parameter reloadViewControllers: Reload the view controller data source.
    internal func reloadPages(reloadViewControllers: Bool) {
        
        if reloadViewControllers || self.viewControllers == nil {
            self.viewControllers = self.dataSource?.viewControllers(forPageboyViewController: self)
        }
        let defaultIndex = self.dataSource?.defaultPageIndex(forPageboyViewController: self) ?? .first
        let defaultIndexValue = self.indexValue(for: defaultIndex)
        
        guard defaultIndexValue < self.viewControllers?.count ?? 0,
            let viewController = self.viewControllers?[defaultIndexValue] else {
                return
        }
        
        self.currentIndex = defaultIndexValue
        self.pageViewController?.setViewControllers([viewController],
                                                    direction: .forward,
                                                    animated: false,
                                                    completion: nil)
        
        guard let viewControllers = self.viewControllers else { return }
        self.delegate?.pageboyViewController(self,
                                             didReload: viewControllers,
                                             currentIndex: defaultIndex)
    }
    
    /// Re-initialize the internal UIPageViewController instance without reloading data source if it currently exists.
    internal func reconfigurePageViewController() {
        guard self.pageViewController != nil else { return }
        self.setUpPageViewController(reloadViewControllers: false)
    }
    
    /// The options to be passed to a UIPageViewController instance.
    internal var pageViewControllerOptions: [String : Any]? {
        var options = [String : Any]()
        
        if self.interPageSpacing > 0.0 {
            options[UIPageViewControllerOptionInterPageSpacingKey] = self.interPageSpacing
        }
        
        guard options.count > 0 else {
            return nil
        }
        return options
    }
    
    // MARK: Utilities
    
    /// Convert a PageIndex to a raw index integer.
    ///
    /// - Parameter pageIndex: The page index to translate.
    /// - Returns: The raw index integer.
    internal func indexValue(for pageIndex: PageIndex) -> Int {
        switch pageIndex {
            
        case .next:
            guard let currentIndex = self.currentIndex else {
                return 0
            }
            var proposedIndex = currentIndex + 1
            if self.isInfiniteScrollEnabled && proposedIndex == self.viewControllers?.count { // scroll back to first index
                proposedIndex = 0
            }
            return proposedIndex
            
        case .previous:
            guard let currentIndex = self.currentIndex else {
                return 0
            }
            var proposedIndex = currentIndex - 1
            if self.isInfiniteScrollEnabled && proposedIndex < 0 { // scroll to last index
                proposedIndex = (self.viewControllers?.count ?? 1) - 1
            }
            return proposedIndex
            
        case .first:
            return 0
            
        case .last:
            return (self.viewControllers?.count ?? 1) - 1
            
        case .atIndex(let index):
            return index
            
        case .at(let index):
            return index
        }
    }
}

// MARK: - UIPageViewControllerDataSource, PageboyViewControllerDataSource
extension PageboyViewController: UIPageViewControllerDataSource {
    
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = self.viewControllers else {
            return nil
        }
        
        if let index = viewControllers.index(of: viewController) {
            if index != 0 {
                return viewControllers[index - 1]
            } else if self.isInfiniteScrollEnabled {
                return viewControllers[viewControllers.count - 1]
            }
        }
        return nil
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = self.viewControllers else {
            return nil
        }
        
        if let index = viewControllers.index(of: viewController) {
            if index != viewControllers.count - 1 {
                return viewControllers[index + 1]
            } else if self.isInfiniteScrollEnabled {
                return viewControllers[0]
            }
        }
        return nil
    }
}
