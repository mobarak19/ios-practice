//
//  PresentAnimator.swift
//  VeiwTransitions
//
//  Created by Mobarak on 4/20/22.
//

import Foundation

import UIKit
class PresentAnimator: NSObject , UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
       
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else {return}
        
        guard let toView = transitionContext.view(forKey: .to) else {return}
        
        transitionContext.containerView.addSubview(toView)
        toView.alpha = 0
        toView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            toView.transform = CGAffineTransform.identity
            toView.alpha = 1
        } completion: { success in
            transitionContext.completeTransition(true)
        }

    }
    
    
    
    
}
