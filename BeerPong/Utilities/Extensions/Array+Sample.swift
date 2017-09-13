//
//  Array+Sample.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation

extension Array {
    func sample() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
