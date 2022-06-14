
import UIKit
import ViewAnimator

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backButtonPress))
        
    }
    
   @objc func backButtonPress()  {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let squire = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.addSubview(squire)
        squire.center = view.center
        squire.backgroundColor = .cyan
        
        squire.animate(animations: [AnimationType.rotate(angle: .pi/5)],delay: 0.51,duration: 1)
        squire.layer.cornerRadius  = 5
    }

}
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backButtonPress))
        
    }
    @objc func backButtonPress()  {
         dismiss(animated: true, completion: nil)
     }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let squire = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.addSubview(squire)
        squire.center = view.center
        squire.backgroundColor = .cyan
        
        squire.animate(animations: [AnimationType.zoom(scale: 5)],delay: 0.51,duration: 1)
        squire.layer.cornerRadius  = 5
    }

}
