
import UIKit

class ViewController: UIViewController {
    let shape = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi/2), endAngle: .pi*2, clockwise: true)
        let trackPath = CAShapeLayer()
        trackPath.path = circlePath.cgPath
        trackPath.lineWidth = 15
        trackPath.fillColor = UIColor.clear.cgColor
        trackPath.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackPath)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.cyan.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        

        
        
        let btn = UIButton(frame: CGRect(x: 30, y: view.frame.size.height - CGFloat(100), width: view.frame.size.width - CGFloat(60), height:50 ))
        view.addSubview(btn)
        btn.backgroundColor = .systemTeal
        btn.addTarget(self, action: #selector(onBtnTouched), for: .touchUpInside)
        btn.setTitle("Animate", for: .normal)
        
    }


    @objc func onBtnTouched()  {
       let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
}

