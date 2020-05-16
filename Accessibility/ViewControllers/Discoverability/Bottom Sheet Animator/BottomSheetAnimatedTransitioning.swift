//
//  BottomSheetAnimatedPresentingTransitioning.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 16/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//


import UIKit

class BottomSheetAnimatedPresentingTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let toVC = transitionContext.viewController(forKey: .to) {
            let containerView = transitionContext.containerView
            
            let finalFrame = transitionContext.finalFrame(for: toVC)
            let initialFrame = finalFrame.offsetBy(dx: 0.0, dy: finalFrame.height)

            toVC.view.frame = initialFrame
            containerView.addSubview(toVC.view)

            UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                           delay: 0.0,
                           options: [.curveEaseOut],
                           animations: {
                            toVC.view.frame = finalFrame
            }) { (finished) in
                transitionContext.completeTransition(finished)
            }
        }
    }
}

class BottomSheetAnimatedDismissalTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let fromVC = transitionContext.viewController(forKey: .from) {
            
            let initialFrame = fromVC.view.frame
            let finalFrame = initialFrame.offsetBy(dx: 0.0, dy: initialFrame.height)

            UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                           delay: 0.0,
                           options: [.curveEaseOut],
                           animations: {
                            fromVC.view.frame = finalFrame
            }) { _ in
                if !transitionContext.transitionWasCancelled {
                    fromVC.view.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
