//
//  UserSearchResultCell.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 19..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class UserSearchResultCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: UserSearchResultViewModel = UserSearchResultViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindComponents()
    }
    
    func bindComponents(){
        self.viewModel.name.asObservable().bind(to: self.nameLabel.rx.text).addDisposableTo(rx.disposeBag)
    }
    
    func bind(to model: Player){
        self.viewModel.model = model
    }

}
