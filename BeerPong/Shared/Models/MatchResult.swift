//
//  MatchResult.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation


struct MatchResult {
    
    var firstTeamScore: Int = 0
    var secondTeamScore: Int = 0
    
    init() {
        self.mocking()
    }
    
    mutating func mocking(){
        self.firstTeamScore = Int(arc4random_uniform(UInt32(10)))
        self.secondTeamScore = Int(arc4random_uniform(UInt32(10)))
    }
    
}
