//
//  ViewController.swift
//  CustomButton
//
//  Created by Mobarak on 9/28/21.
//

import UIKit

class ViewController: UIViewController {
    var stackview = UIStackView()
    var height=60
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        let facebook=SocialButton(frame: CGRect(x: 0, y: 0, width:height, height: height))
        stackview.addArrangedSubview(facebook)
        facebook.configure(with:UIImage(named:"facebook.png")!)
        let google=SocialButton(frame: CGRect(x:90, y: 0, width:height, height: height))
        stackview.addArrangedSubview(google)
        google.configure(with:UIImage(named:"google.png")!)
        
        google.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
        
        facebook.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
    }
    
    
    @objc func googleButtonPressed(button:UIButton){
        print("googleButtonPressed")
    }
    
    @objc func facebookButtonPressed(button:UIButton){
        print("facebookButtonPressed")
    }
    private func configureStackView(){
        
        stackview.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(stackview)
        stackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100).isActive = true
        stackview.spacing = 50
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackview.widthAnchor.constraint(equalToConstant: 170).isActive = true
        stackview.heightAnchor.constraint(equalToConstant: CGFloat(self.height)).isActive = true
    
    }

}

