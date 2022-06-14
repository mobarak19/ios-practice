//
//  HeaderView.swift
//  CollectionViewInTableView
//
//  Created by Mobarak on 11/10/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifire = "HeaderReusableView"
   
   private let label : UILabel = {
       let label = UILabel()
    label.text = "Header"
    label.textAlignment = .center
    label.textColor = .red
       return label
       
   }()
   public func configure(){
   
    backgroundColor = .systemBackground
    addSubview(label)
   }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
