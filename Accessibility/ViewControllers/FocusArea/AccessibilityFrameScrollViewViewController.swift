//
//  AccessibilityFrameScrollViewViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 26/04/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityFrameScrollViewViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var scrollViewButton: UIButton!


    // MARK: - Viewcontroller lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollViewButton.accessibilityPath = UIBezierPath(rect: view.convert(scrollViewButton.frame, from: scrollViewButton.superview!))
    }
}

// MARK: - UIScrollView delegate
extension AccessibilityFrameScrollViewViewController: UIScrollViewDelegate {

    // The fix is to update the accessibility path at scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewButton.accessibilityPath = UIBezierPath(rect: view.convert(scrollViewButton.frame, from: scrollViewButton.superview!))
    }
}
