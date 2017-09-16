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

class MatchDetailsViewModel: NSObject, ImageDownloadable {

    var model: Match = Match(){
        didSet {
            self.winnerImage.value = Constants.Images.TeamPlaceholder
            self.loserImage.value = Constants.Images.TeamPlaceholder
            self.setPlace(from: model)
            
            self.matchResult.value = self.createTime(matchResult: model.result)
            self.isGoldenCup.value = model.result.isGoldenCup
            self.time.value = model.result.time
        }
    }
    
    var winnerName: Variable<String> = Variable("")
    var loserName: Variable<String> = Variable("")
    var winnerImage: Variable<UIImage> = Variable(Constants.Images.TeamPlaceholder)
    var loserImage: Variable<UIImage> = Variable(Constants.Images.TeamPlaceholder)
    var matchResult: Variable<String> = Variable("")
    var isGoldenCup: Variable<Bool> = Variable(true)
    var time: Variable<String> = Variable("")
    
    func createTime(matchResult: MatchResult) -> String{
        return matchResult.firstTeamScore < matchResult.secondTeamScore ? "\(matchResult.firstTeamScore) : \(matchResult.secondTeamScore)" : "\(matchResult.secondTeamScore) : \(matchResult.firstTeamScore)"
    }
    
    func setPlace(from match: Match){
        if match.result.firstTeamScore < match.result.secondTeamScore {
            self.winnerName.value = match.firstTeam.name
            self.download(from: match.firstTeam.profileImageURL!, to: self.winnerImage)
            self.loserName.value = match.secondTeam.name
            self.download(from: match.secondTeam.profileImageURL!, to: self.loserImage)
        }else{
            self.winnerName.value = match.secondTeam.name
            self.download(from: match.secondTeam.profileImageURL!, to: self.winnerImage)
            self.loserName.value = match.firstTeam.name
            self.download(from: match.firstTeam.profileImageURL!, to: self.loserImage)
        }
    }
}
