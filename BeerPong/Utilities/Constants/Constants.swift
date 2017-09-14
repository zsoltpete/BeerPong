//
//  Constants.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Cells {
        static let MatchCell = "MatchCell"
    }
    
    struct Images {
        static let BlurredPlasticGlass: UIImage = UIImage(named: "blurred_plastic_glass")!              //#imageLiteral(resourceName: "blurred_plastic_glass")
        static let BlurredBeer: UIImage = UIImage(named: "blurred_beer")!                               //#imageLiteral(resourceName: "blurred_beer")
        static let TeamPlaceholder: UIImage = UIImage(named: "team_placeholder")!                       //#imageLiteral(resourceName: "team_placeholder")
    }
    
    struct Times {
        static let AlphaAnimation: Double = 0.4
    }
}
