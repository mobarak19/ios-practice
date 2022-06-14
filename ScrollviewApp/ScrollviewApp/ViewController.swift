//
//  ViewController.swift
//  ScrollviewApp
//
//  Created by Mobarak on 4/18/22.
//

import UIKit

class ViewController: UIViewController {

    let scrollview : UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        addScrollView()

    }
    func addScrollView()  {
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollview)
        NSLayoutConstraint.activate([
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollview.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        scrollview.backgroundColor = .red
        let rView = UIView()
        rView.translatesAutoresizingMaskIntoConstraints = false
        scrollview.addSubview(rView)
        
        NSLayoutConstraint.activate([
            rView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 10),
            rView.heightAnchor.constraint(equalTo: scrollview.heightAnchor, constant: -20),
            rView.widthAnchor.constraint(equalTo: scrollview.widthAnchor, constant: -20),
            rView.topAnchor.constraint(equalTo: scrollview.topAnchor,constant: 10)
        ])
        rView.backgroundColor = .cyan

    }

    
}

