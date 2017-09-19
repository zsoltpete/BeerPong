//
//  UserSearchResultViewModel.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class UserSearchResultViewModel: NSObject {
    
    var model: Player = Player(){
        didSet {
            self.name.value = model.playerName
        }
    }
    
    var name: Variable<String> = Variable("")

}
