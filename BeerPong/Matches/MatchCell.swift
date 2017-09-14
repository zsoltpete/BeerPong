//
//  MatchCell.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class MatchCell: UITableViewCell {

    var viewModel: MatchViewModel = MatchViewModel()
    
    @IBOutlet weak var secondTeamProfileImageView: ProfileImageView!
    @IBOutlet weak var firstTeamProfileImageView: ProfileImageView!
    @IBOutlet weak var matchResultLabel: UILabel!
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindComponents()
    }

    func bindComponents(){
        self.viewModel.firstTeamName.asObservable().bind(to: self.firstTeamNameLabel.rx.text).addDisposableTo(rx.disposeBag)
        self.viewModel.secondTeamName.asObservable().bind(to: self.secondTeamNameLabel.rx.text).addDisposableTo(rx.disposeBag)
        self.viewModel.matchResult.asObservable().bind(to: self.matchResultLabel.rx.text).addDisposableTo(rx.disposeBag)
        self.viewModel.firstTeamImage.asObservable().bind(to: self.firstTeamProfileImageView.imageView.rx.image).addDisposableTo(rx.disposeBag)
        self.viewModel.secondTeamImage.asObservable().bind(to: self.secondTeamProfileImageView.imageView.rx.image).addDisposableTo(rx.disposeBag)
        self.viewModel.primaryColor.asObservable().subscribe(onNext: self.handlePrimaryColor).addDisposableTo(rx.disposeBag)
    }
    
    func bind(to model: Match){
        self.initView()
        self.rowAnimation()
        self.viewModel.model = model
    }
    
    func setIndex(index: Int){
        self.viewModel.index = index
    }
    
    func initView(){
        self.alpha = 0.0
    }
    
    func handlePrimaryColor(color: UIColor){
        self.firstTeamNameLabel.textColor = color
        self.secondTeamNameLabel.textColor = color
        self.matchResultLabel.textColor = color
        self.firstTeamProfileImageView.borderColor = color
        self.secondTeamProfileImageView.borderColor = color
    }
    
}
