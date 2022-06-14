
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateView: UIView!
    
    @IBOutlet weak var viewYPosition: NSLayoutConstraint!
    
    var isShow = true
    override func viewDidLoad() {
        super.viewDidLoad()
        hideView()
    }

    @IBAction func btnClicked(_ sender: Any) {
      
        springAnimation(show:!isShow)
        
    }
    
    func animateAction(show:Bool) {
        UIView.animate(withDuration: 1) { [weak self] in
            if show {
                self?.showView()
            }else{
                self?.hideView()
            }
            self?.view.layoutIfNeeded()
        }
        
    }
    
    func springAnimation(show:Bool)  {
        
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.4,
                       options:.curveEaseInOut) {[weak self] in
                            if show {
                                self?.showView()
                            }else{
                                self?.hideView()
                            }
                            self?.view.layoutIfNeeded()
        } completion: { success in
            print("animation completed")
        }

    }
    
    func hideView()  {
        isShow = false
        viewYPosition.constant = -(animateView.frame.origin.y) - (animateView.frame.size.height)
    }
    
    func showView()  {
        isShow = true
        viewYPosition.constant = 20

    }
}

