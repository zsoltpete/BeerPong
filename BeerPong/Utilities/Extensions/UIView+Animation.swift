//
//  UIView+Animation.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 14..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func rowAnimation(){
        UIView.animate(withDuration: Constants.Times.RowAnimation) {
            self.alpha = 1.0
        }
    }
    
}
