//
//  CustomTableViewCell.swift
//  CollectionViewInTableView
//
//  Created by Mobarak on 11/9/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifire = "CustomTableViewCell"
    static func nib()->UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    @IBOutlet var collectionView : UICollectionView!
    
    
    var models = [Model]()
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifire)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with models: [Model],isHorizontal:Bool){
        self.models = models
        if isHorizontal {
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                  layout.scrollDirection = .horizontal
             }
        }
    }
    
}

extension CustomTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: HeaderView.identifire, for: indexPath) as! HeaderView

           header.configure()
         return header
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifire, for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newWidth = collectionView.frame.width / 3 - 18
        let newHeight = collectionView.frame.width / 3 + 15
   

        return CGSize(width: newWidth, height: newHeight)
       // return CGSize(width:100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
       
        
        return CGSize(width: contentView.frame.width, height: 60)
    }
}
