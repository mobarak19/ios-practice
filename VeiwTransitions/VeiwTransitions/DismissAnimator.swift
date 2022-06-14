//
//  DismissAnimator.swift
//  VeiwTransitions
//
//  Created by Mobarak on 4/20/22.
//

import Foundation
import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else {return}
        
        guard let toView = transitionContext.view(forKey: .to) else {return}
        
        transitionContext.containerView.insertSubview(toView, belowSubview: fromView)

        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            fromView.alpha = 0
            fromView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        } completion: { success in
            transitionContext.completeTransition(true)
        }

    }
    
    
}
