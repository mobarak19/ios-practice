//
//  VerticalCollectionViewCell.swift
//  CollectionViewInTableView
//
//  Created by Mobarak on 11/10/21.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {

    @IBOutlet var label : UILabel!

    @IBOutlet var imageView : UIImageView!
    
    static let identifire = "VerticalCollectionViewCell"
    static func nib()->UINib {
        return UINib(nibName: "VerticalCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    public func configure(with model: Model){
        self.label.text = model.name
        self.imageView.image = UIImage(named: model.imageName)
        self.imageView.contentMode = .scaleAspectFill
    }
    
}
