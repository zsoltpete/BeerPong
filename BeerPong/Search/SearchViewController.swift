//
//  SearchViewController.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

//
//  ProfileViewController.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 17..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx
import Tabman
import Pageboy

class SearchViewController: TabmanViewController {
    
    var players: Variable<[Player]> = Variable([])
    var profileMasterView: ProfileMasterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMasterView()
        self.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func initMasterView(){
        guard let masterView: ProfileMasterView = self.view as? ProfileMasterView else {
            return
        }
        profileMasterView = masterView
    }
    
    
    
}

extension SearchViewController: PageboyViewControllerDataSource {
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
        let viewControllers = self.initChildViewControllers()
        self.bar.items = [Item(title: "Users")]
        
        return viewControllers
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        return nil
    }
    
    func initChildViewControllers() -> [UIViewController]{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userSearchResultViewController: UserSearchResultViewController = storyboard.instantiateViewController(withIdentifier: "UserSearchResultViewController") as! UserSearchResultViewController
        
        return [userSearchResultViewController]
    }
    
}

