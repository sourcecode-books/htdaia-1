//
//  AccessibilityFrameViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 26/04/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityFrameViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var button: UIButton!

    // MARK: - Viewcontroller lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // The fix is to use on-screen coordinates via one of the convert methods.
        button.accessibilityPath = UIBezierPath(rect: view.convert(button.frame, from: button.superview!))
    }
}
