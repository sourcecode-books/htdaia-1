//
//  BottomSheetTransitioningDelegate.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 16/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//


import UIKit

class BottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomSheetAnimatedPresentingTransitioning()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomSheetAnimatedDismissalTransitioning()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BottomSheetPresentationController(presentedViewController: presented,
                                                 presenting: presenting)
    }
}
