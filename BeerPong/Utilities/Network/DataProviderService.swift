//
//  DataProviderService.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation
import RxSwift


private let _shared = FirebaseDataProvider()

protocol DataProviderProtocol {
    
    func getPlayers() -> Observable<[Player]>
    
}


class DataProviderService {
    class var shared: DataProviderProtocol { return _shared }
}
