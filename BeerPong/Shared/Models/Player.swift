//
//  Player.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation


class Player: BaseModel {
    
    var playerName: String =  ""
    var firstName: String?
    var lastName: String?
    
    override init() {
        //self.mocking()
        super.init()
    }
    
    func mocking(){
        self.playerName = ["zsoltpete","egabor", "iujlaki", "csellelajos", "csgabor", "saca", "gismo", "jani"].sample()!
        self.firstName = ["Zsolt","Gábor", "Imre", "Lajos", "Gábor", "Sándor", "György", "János"].sample()!
        self.lastName = ["Pete","Eszenyi", "Ujlaki", "Cselle", "Csizmadia", "Csáki", "Szabó", "Hausenberg"].sample()!
    }
    
    override init(snapshot: [String: AnyObject], for referenceId: String) {
        playerName = snapshot["player_name"] as! String
        firstName = snapshot["first_name"] as? String
        lastName = snapshot["last_name"] as? String
        super.init(referenceId: referenceId)
    }
    
    func toAnyObject() -> Any {
        return [
            "player_name": playerName,
            "first_name": firstName,
            "last_name": lastName
        ]
    }
    
}
