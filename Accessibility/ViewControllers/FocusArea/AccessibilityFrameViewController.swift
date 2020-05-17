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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    // MARK: - Viewcontroller lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpLabels()
        button.accessibilityPath = UIBezierPath(rect: button.frame)
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setUpLabels() {
        titleLabel.text = Localizable.string(for: LocalizedKey.FocusArea.focusAreaTitle.key)
        descriptionLabel.text = Localizable.string(for: LocalizedKey.FocusArea.accessibilityFrameDescription.key)
        button.setTitle(Localizable.string(for: LocalizedKey.FocusArea.accessibilityFrameButtonTitle.key), for: .normal)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        button.accessibilityPath = UIBezierPath(rect: view.convert(button.frame, from: button.superview!))
    }
}
