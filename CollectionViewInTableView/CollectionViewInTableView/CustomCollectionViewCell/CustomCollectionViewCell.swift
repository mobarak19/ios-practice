//
//  CustomCollectionViewCell.swift
//  CollectionViewInTableView
//
//  Created by Mobarak on 11/9/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet var label : UILabel!

    @IBOutlet var imageView : UIImageView!
    
    static let identifire = "CustomCollectionViewCell"
    static func nib()->UINib {
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
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
