//
//  MatchDetailsViewModel.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 14..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx
import SDWebImage

class MatchDetailsViewModel: NSObject {

    var model: Match = Match(){
        didSet {
            self.winnerName.value = model.firstTeam.name
            self.loserName.value = model.secondTeam.name
            self.winnerImage.value = Constants.Images.TeamPlaceholder
            self.loserImage.value = Constants.Images.TeamPlaceholder
            
            SDWebImageManager.shared().downloadImage(with: URL(string: model.firstTeam.profileImageURL!), options: .progressiveDownload, progress:nil) {  [ weak self] (maybeImage, maybeError, cacheType, finished: Bool, imageURL) in
                if maybeImage != nil  && finished == true{
                    self?.winnerImage.value = maybeImage!
                }
            }
            
            SDWebImageManager.shared().downloadImage(with: URL(string: model.secondTeam.profileImageURL!), options: .progressiveDownload, progress:nil) {  [ weak self] (maybeImage, maybeError, cacheType, finished: Bool, imageURL) in
                if maybeImage != nil  && finished == true{
                    self?.loserImage.value = maybeImage!
                }
            }
        }
    }
    
    var winnerName: Variable<String> = Variable("")
    var loserName: Variable<String> = Variable("")
    var winnerImage: Variable<UIImage> = Variable(Constants.Images.TeamPlaceholder)
    var loserImage: Variable<UIImage> = Variable(Constants.Images.TeamPlaceholder)
    
}
