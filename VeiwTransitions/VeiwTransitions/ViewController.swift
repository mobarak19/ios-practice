//
//  ViewController.swift
//  VeiwTransitions
//
//  Created by Mobarak on 4/20/22.
//

import UIKit

class ViewController: UIViewController {

    let btn : UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Show", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        
        return btn
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        view.addSubview(btn)
        btn.center = view.center
        view.backgroundColor = .systemRed
        btn.addTarget(self, action: #selector(showTapped), for: .touchUpInside)
    }


    @objc func showTapped() {
        let vc = SecondVC()
        
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .currentContext

        self.present(vc, animated: true, completion: nil)
    }
}
extension ViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
