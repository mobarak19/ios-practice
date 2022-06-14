//
//  ViewController.swift
//  ViewBottomBorder
//
//  Created by Mobarak on 11/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.addBottomBorderWithColor(color: .red, width: 2.0)
        // Do any additional setup after loading the view.
    }


}

extension UIView {
    func addBottomBorderWithColor(color:UIColor,width: CGFloat) {
        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
    
        bottomBorderLine.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
        
        self.layer.addSublayer(bottomBorderLine)
    }
}
