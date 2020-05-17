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
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!


    // MARK: - Properties
    var colorMode: ColorMode = .light

    // MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(toggleDarkMode), for: .touchUpInside)
        setUpLabels()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setUpLabels() {
        let key = isAccessibilityFixed ? LocalizedKey.FocusArea.accessibilityActivationPointFixed.key : LocalizedKey.FocusArea.accessibilityActivationPointBroken.key
        descriptionLabel.text = Localizable.string(for: key)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        containerView.accessibilityLabel = Localizable.string(for: LocalizedKey.FocusArea.colorModePreference.key)
        containerView.isAccessibilityElement = true
        containerView.accessibilityTraits = button.accessibilityTraits
        containerView.accessibilityActivationPoint = containerView.convert(button.center, to: view)
    }

    // MARK: - User actions
    @objc private func toggleDarkMode() {
        let darkMode = colorMode == .dark
        colorMode = darkMode ? .light : .dark
        view.backgroundColor = darkMode ? .black : .white
        buttonLabel.textColor = darkMode ? .white : .black
        descriptionLabel.textColor = darkMode ? .white : .black
    }
}
