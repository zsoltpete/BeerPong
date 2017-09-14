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
    
    func inAlphaAnimation(){
        UIView.animate(withDuration: Constants.Times.AlphaAnimation) {
            self.alpha = 1.0
        }
    }
    
    func outAlphaAnimation(){
        UIView.animate(withDuration: Constants.Times.AlphaAnimation) {
            self.alpha = 0.0
        }
    }
    
}
