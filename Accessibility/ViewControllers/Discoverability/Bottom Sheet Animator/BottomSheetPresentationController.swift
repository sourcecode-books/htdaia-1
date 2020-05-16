//
//  BottomSheetPresentationController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 16/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//


import UIKit

class BottomSheetPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        
        let bounds = self.containerView!.bounds
        let size = self.targetPresentedViewCntrollerSizeFor(bounds.size)
        
        var bottomInset: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            bottomInset = self.containerView?.safeAreaInsets.bottom ?? 0.0
        }
        
        let targetHeight = size.height + bottomInset
        
        return CGRect(x: 0.0,
                      y: bounds.height - targetHeight,
                      width: size.width,
                      height: targetHeight)
    }
    
    var dimmingView: UIView?
    
    override func presentationTransitionWillBegin() {
        self.dimmingView = UIView()
        self.dimmingView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.dimmingView?.frame = self.containerView!.bounds
        self.dimmingView?.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss(_:)))
        self.dimmingView?.addGestureRecognizer(tapRecognizer)
        
        self.containerView?.addSubview(dimmingView!)
        
        self.dimmingView?.alpha = 0.0
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.dimmingView?.alpha = 1.0
        }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            self.dimmingView?.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.dimmingView?.alpha = 0.0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.dimmingView?.removeFromSuperview()
            self.dimmingView = nil
        }
    }
    
    private func targetPresentedViewCntrollerSizeFor(_ size: CGSize) -> CGSize {
        let requiredSize = self.presentedViewController.view.systemLayoutSizeFitting(CGSize(width: size.width, height: 0.0),
                                                                                     withHorizontalFittingPriority: .required,
                                                                                     verticalFittingPriority: UILayoutPriority(1.0))
        return requiredSize
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let requiredSize = targetPresentedViewCntrollerSizeFor(size)
        var bottomInset: CGFloat = 0.0
        if #available(iOS 11.0, *) {
            bottomInset = self.containerView?.safeAreaInsets.bottom ?? 0.0
        }
        
        let targetHeight = requiredSize.height + bottomInset
        coordinator.animate(alongsideTransition: { (_) in
            self.presentedViewController.view.frame = CGRect(x: 0.0,
                                                             y: size.height - targetHeight,
                                                             width: requiredSize.width,
                                                             height: targetHeight)
        }, completion: nil)
    }
    
    @objc private func dismiss(_ recognizer: UITapGestureRecognizer) {
        self.presentingViewController.dismiss(animated: true, completion: nil)
    }
    
}
