//
//  UserSearchResultViewController.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class UserSearchResultViewController: UIViewController {
    
    var userSearchResultMasterView: UserSearchResultMasterView?
    var players: Variable<[Player]> = Variable([])
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMasterView()
        self.initObservers()
        self.getPlayers()
    }

    func initMasterView(){
        guard let masterView: UserSearchResultMasterView = self.view as? UserSearchResultMasterView else {
            return
        }
        self.userSearchResultMasterView = masterView
    }
    
}

extension UserSearchResultViewController {
    
    func getPlayers(){
        DataProviderService.shared.getPlayers().subscribe(onNext: { [weak self] players in
            self?.players.value = players
        }).addDisposableTo(rx.disposeBag)
    }
    
}

extension UserSearchResultViewController {
    
    func initObservers(){
        self.initBinding()
    }
    
    func initBinding(){
        self.players.asObservable().bind(to: self.userSearchResultMasterView!.tableView.rx.items(cellIdentifier: Constants.Cells.UserSearchResultCell))(self.handleBinding).addDisposableTo(rx.disposeBag)
    }
    
    func handleBinding(index: Int, model: Player, cell: UserSearchResultCell){
        cell.bind(to: model)
    }
    
}
