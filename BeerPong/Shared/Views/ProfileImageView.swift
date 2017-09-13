//
//  ProfileImageView.swift
//  BeerPong
//
//  Created by Zsolt Pete on 2017. 09. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//


import UIKit

@IBDesignable
class ProfileImageView: UIView {
    
    @IBInspectable var imageName: String = "" {
        didSet {
            self.imageView.image = UIImage(named: imageName)
            self.imageView.layer.masksToBounds = true
        }
    }
    @IBInspectable var hasBadge: Bool = true {
        didSet {
            self.badgeImageView.isHidden = !hasBadge
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.containerView.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.containerView.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var badgeImageView: UIImageView!
    
    var contentView: UIView?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loadXib()
    }
    
    func loadXib() {
        guard contentView == nil else { return }
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
        
        self.badgeImageView.isHidden = !hasBadge
        self.containerView.layer.borderWidth = borderWidth
        self.containerView.layer.borderColor = borderColor.cgColor
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ProfileImageView", bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.loadXib()
        contentView?.prepareForInterfaceBuilder()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.containerView.layer.cornerRadius = self.frame.size.height/2.0
        self.imageView.layer.cornerRadius = self.imageView.bounds.size.height/2.0
    }
    
    
}

