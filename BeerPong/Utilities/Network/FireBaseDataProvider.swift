//
//  FireBaseDataProvider.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import Firebase
import RxSwift

class FirebaseDataProvider: DataProviderProtocol {
    
    let playersRef = Database.database().reference(withPath: "players")
    func getPlayers() -> Observable<[Player]>{
        return Observable.create({ (observer: AnyObserver<[Player]>) -> Disposable in
            self.playersRef.observeSingleEvent(of: .value, with: { (snapshot: DataSnapshot) in
                var players: Array<Player> = []
                let enumerator = snapshot.children
                while let player = enumerator.nextObject() as? DataSnapshot {
                    players.append(Player(snapshot: player.value as! [String: AnyObject], for: player.key))
                }
                observer.on(.next(players))
                observer.on(.completed)
            })
            return Disposables.create()
        })
    }
    
}
