//
//  MatchDetailsHeaderView.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 14..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class MatchDetailsHeaderView: UIView {
    
    var viewModel: MatchDetailsViewModel = MatchDetailsViewModel()

    @IBOutlet weak var winnerImageView: ProfileImageView!
    @IBOutlet weak var loserImageView: ProfileImageView!
    @IBOutlet weak var winnerNameLabel: UILabel!
    @IBOutlet weak var loserNameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var goldenCupImageView: UIImageView!
    @IBOutlet weak var goldenCupContainerView: UIView!
    @IBOutlet weak var timeContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindComponents()
    }
    
    func bindComponents(){
        self.viewModel.winnerName.asObservable().bind(to: self.winnerNameLabel.rx.text).addDisposableTo(rx.disposeBag)
        self.viewModel.loserName.asObservable().bind(to: self.loserNameLabel.rx.text).addDisposableTo(rx.disposeBag)
        self.viewModel.winnerImage.asObservable().bind(to: self.winnerImageView.imageView.rx.image).addDisposableTo(rx.disposeBag)
        self.viewModel.loserImage.asObservable().bind(to: self.loserImageView.imageView.rx.image).addDisposableTo(rx.disposeBag)
        self.viewModel.isGoldenCup.asObservable().bind(to: self.goldenCupContainerView.rx.isHidden).addDisposableTo(rx.disposeBag)
        self.viewModel.time.asObservable().bind(to: self.timeLabel.rx.text).addDisposableTo(rx.disposeBag)
        self.viewModel.matchResult.asObservable().bind(to: self.resultLabel.rx.text).addDisposableTo(rx.disposeBag)
    }
    
    func bind(to model: Match){
        self.viewModel.model = model
    }
    
}
