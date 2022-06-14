//
//  ViewController.swift
//  CollectionViewCompositeLayoutApp
//
//  Created by Mobarak on 11/8/21.
//

import UIKit

class ViewController: UIViewController{


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        let searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
        searchCollectionView.frame = self.view.bounds
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.backgroundColor = .white
        searchCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.view.addSubview(searchCollectionView)
    }
    
    
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.backgroundColor = .random
        return cell
    }
    
}

extension UIColor{
    static var random : UIColor{
        return UIColor(red: .random(in: 0.4...1),green: .random(in: 0.4...1),blue: .random(in: 0.4...1),alpha: 1)
    }
}
