//
//  ProfileViewController.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 17..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class ProfileViewController: UIViewController {

    var profileMasterView: ProfileMasterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMasterView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func initMasterView(){
        guard let masterView: ProfileMasterView = self.view as? ProfileMasterView else {
            return
        }
        profileMasterView = masterView
    }
    
    

}
