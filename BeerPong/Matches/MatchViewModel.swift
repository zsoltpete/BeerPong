//
//  MatchViewModel.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

class MatchViewModel: NSObject {
    
    
    var model: Match = Match(){
        didSet{
            self.firstTeamName.value = model.firstTeam.name
            self.secondTeamName.value = model.secondTeam.name
            self.matchResult.value = "\(model.result.firstTeamScore) : \(model.result.secondTeamScore)"
            self.firstTeamImage.value = Constants.Images.TeamPlaceholder
            self.secondTeamImage.value = Constants.Images.TeamPlaceholder
            
            SDWebImageManager.shared().downloadImage(with: URL(string: model.firstTeam.profileImageURL!), options: .progressiveDownload, progress:nil) {  [ weak self] (maybeImage, maybeError, cacheType, finished: Bool, imageURL) in
                if maybeImage != nil  && finished == true{
                    self?.firstTeamImage.value = maybeImage!
                }
            }
            
            SDWebImageManager.shared().downloadImage(with: URL(string: model.secondTeam.profileImageURL!), options: .progressiveDownload, progress:nil) {  [ weak self] (maybeImage, maybeError, cacheType, finished: Bool, imageURL) in
                if maybeImage != nil  && finished == true{
                    self?.secondTeamImage.value = maybeImage!
                }
            }
        }
    }
    
    var index: Int = 0 {
        didSet{
            self.primaryColor.value = (index % 2 == 0) ? UIColor.lightBeer : UIColor.darkBeer
            
        }
    }
    
    var firstTeamName: Variable<String> = Variable("")
    var secondTeamName: Variable<String> = Variable("")
    var matchResult: Variable<String> = Variable("")
    var firstTeamImage: Variable<UIImage> = Variable(Constants.Images.TeamPlaceholder)
    var secondTeamImage: Variable<UIImage> = Variable(Constants.Images.TeamPlaceholder)
    var primaryColor: Variable<UIColor> = Variable(UIColor.lightBeer)
    
}
