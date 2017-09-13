//
//  Player.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation


struct Player {
    
    var playerName: String =  ""
    var firstName: String?
    var lastName: String?
    
    init() {
        self.mocking()
    }
    
    mutating func mocking(){
        self.playerName = ["zsoltpete","egabor", "iujlaki", "csellelajos", "csgabor", "saca", "gismo", "jani"].sample()!
        self.firstName = ["Zsolt","Gábor", "Imre", "Lajos", "Gábor", "Sándor", "György", "János"].sample()!
        self.lastName = ["Pete","Eszenyi", "Ujlaki", "Cselle", "Csizmadia", "Csáki", "Szabó", "Hausenberg"].sample()!
    }
    
}
