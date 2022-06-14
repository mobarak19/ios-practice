//
//  ViewController.swift
//  TabbarApp
//
//  Created by Mobarak on 4/3/22.
//

import UIKit

class ViewController: UIViewController {

    let btn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        btn.setTitle("Show tabbar", for: .normal)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(btn)
        btn.backgroundColor = .cyan
        btn.center = view.center
        btn.addTarget(self, action: #selector(onTouchBtn), for: .touchUpInside)
    }

    @objc func onTouchBtn(){
        
        let v1 = HomeVC()
        let v2 = CartVC()
        let v3 = BalanceVC()
        let v4 = TrackVC()

        let tabBar = UITabBarController()
        
        v1.title = "Home"
        v2.title = "Cart"
        v3.title = "Balance"
        v4.title = "Track"

        tabBar.setViewControllers([v1,v2,v3,v4], animated: false)
        
    
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.tabBar.backgroundColor = .white
        
        guard let items = tabBar.tabBar.items else {return}

        for item in items {
            item.image = UIImage(systemName: "house")
        }
        present(tabBar, animated: false, completion: nil)
        
    }

}

class HomeVC:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .cyan
    }
}

class CartVC:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
}

class BalanceVC:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemMint
    }
}

class TrackVC:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    }
}
