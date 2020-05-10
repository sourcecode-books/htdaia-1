//
//  AccessibilityActivationPointViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 26/04/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

enum ColorMode {
    case dark
    case light
}

final class AccessibilityActivationPointViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.addTarget(self, action: #selector(toggleDarkMode), for: .touchUpInside)
        }
    }
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreInfoLabel: UILabel!

    // MARK: - Properties
    var colorMode: ColorMode = .light

    // MARK: - Viewcontroller lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpAccessibility()
    }

    private func setUpAccessibility() {
        containerView.isAccessibilityElement = true
        containerView.accessibilityTraits = [.button]
        containerView.accessibilityLabel = Localizable.string(for: "Color mode preference")

        // The fix is to set the activation-point
        containerView.accessibilityActivationPoint = containerView.convert(button.center, to: view)
    }

    @objc private func toggleDarkMode() {
        let darkMode = colorMode == .dark
        colorMode = darkMode ? .light : .dark
        view.backgroundColor = darkMode ? .black : .white
        titleLabel.textColor = darkMode ? .white : .black
        moreInfoLabel.textColor = darkMode ? .white : .black
    }
}
