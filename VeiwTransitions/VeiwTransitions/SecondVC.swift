//
//  SecondVC.swift
//  VeiwTransitions
//
//  Created by Mobarak on 4/20/22.
//

import UIKit

class SecondVC: UIViewController {
    let btn : UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Hide", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        view.addSubview(btn)
        btn.center = view.center
        btn.addTarget(self, action: #selector(hideTapped), for: .touchUpInside)
    }
    
    @objc func hideTapped() {
      dismiss(animated: true, completion: nil)
    }


}
