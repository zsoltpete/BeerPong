//
//  MatchDetailsViewController.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 14..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class MatchDetailsViewController: UIViewController {

    var match: Variable<Match> = Variable(Match())
    var matchDetailsMasterView: MatchDetailsMasterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMasterView()
        self.initObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.matchDetailsMasterView?.matchBackgroundImageView.inAlphaAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.matchDetailsMasterView?.matchBackgroundImageView.alpha = 0.0
    }
    
    func initMasterView(){
        guard let masterView: MatchDetailsMasterView = self.view as? MatchDetailsMasterView else {
            return
        }
        self.matchDetailsMasterView = masterView
    }

}

extension MatchDetailsViewController{
    
    func initObservers(){
        self.initMatchBinding()
    }
    
    func initMatchBinding(){
        self.match.asObservable().subscribe(onNext: self.handleMatchBinding).addDisposableTo(rx.disposeBag)
    }
    
    func handleMatchBinding(match: Match){
        self.matchDetailsMasterView?.matchDetailsHeaderView.bind(to: match)
    }
    
}
