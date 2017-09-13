//
//  Team.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation

struct Team {
    
    var firstPlayer: Player = Player()
    var secondPlayer: Player = Player()
    var name: String = ""
    var profileImageURL: String?
    
    init() {
        self.mocking()
    }
    
    mutating func mocking(){
        self.name = ["The Best","Inni jöttünk", "Innák", "Pikachu", "null(just kiddin')", "Harman", "Bumm", "Pls"].sample()!
        self.profileImageURL = [
            "https://lorempixel.com/output/abstract-q-c-400-400-5.jpg",
            "https://lorempixel.com/output/fashion-q-c-400-400-4.jpg",
            "https://lorempixel.com/output/animals-q-c-400-400-1.jpg",
            "https://lorempixel.com/output/sports-q-c-400-400-2.jpg",
            "https://lorempixel.com/output/transport-q-c-400-400-9.jpg",
            "https://lorempixel.com/output/nature-q-c-400-400-4.jpg",
        ].sample()
    }
}
