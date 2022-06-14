//
//  SocialButton.swift
//  CustomButton
//
//  Created by Mobarak on 9/28/21.
//

import UIKit

final class SocialButton:UIButton{
    
    private let imgView : UIImageView = {
        let imageV = UIImageView()
        imageV.tintColor = .white
        imageV.contentMode = .scaleToFill
        imageV.clipsToBounds = true
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(imgView)
        clipsToBounds=true
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
             
    func configure(with image:UIImage) {
        imgView.image = image
   }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.frame=CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
    }
}
