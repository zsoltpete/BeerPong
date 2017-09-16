//
//  ImageDownloadable.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 16..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import RxCocoa
import RxSwift

protocol ImageDownloadable {
    
    func download(from url: String, to image: Variable<UIImage>)
    
}

extension ImageDownloadable{
    
    func download(from url: String, to image: Variable<UIImage>) {
        SDWebImageManager.shared().downloadImage(with: URL(string: url), options: .progressiveDownload, progress:nil) { (maybeImage: UIImage?, maybeError, cacheType, finished: Bool, imageURL) in
            if maybeImage != nil  && finished == true{
                image.value = maybeImage!
            }
        }
    }
    
}
