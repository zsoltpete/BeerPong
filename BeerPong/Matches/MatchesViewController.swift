//
//  MatchesViewController.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class MatchesViewController: UIViewController {

    let matches: Variable<[Match]> = Variable([Match(), Match(), Match(), Match(), Match(), Match(), Match()])
    var matchesMasterView: MatchesMasterView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMasterView()
        self.initObservers()
    }

    func initMasterView(){
        guard let masterView: MatchesMasterView = self.view as? MatchesMasterView else {
            return
        }
        self.matchesMasterView = masterView
    }
    
}


extension MatchesViewController{

    func initObservers(){
        self.initBinding()
    }
    
    func initBinding(){
        self.matches.asObservable().bind(to: self.matchesMasterView!.tableView.rx.items(cellIdentifier: Constants.Cells.MatchCell))(self.handleBinding).addDisposableTo(rx.disposeBag)
    }
    
    func handleBinding(index: Int, model: Match, cell: MatchCell){
        cell.bind(to: model)
    }
    
}
