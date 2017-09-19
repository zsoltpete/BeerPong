//
//  BaseModel.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var referenceId: String = ""
    
    override init() {
        super.init()
    }
    
    init(referenceId: String){
        self.referenceId = referenceId
    }
    
    init(snapshot: [String: AnyObject], for referenceId: String) {
        self.referenceId = referenceId
        
    }
}
