//
//  AccessibilityElementHiddensViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityElementsHiddenViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var decreaseBrigthnessButton: UIButton!
    @IBOutlet weak var increaseBrightnessButton: UIButton!

    // MARK: - ViewController lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.alpha = 0.0
        popUpView.layer.cornerRadius = 5.0
        decreaseBrigthnessButton.layer.cornerRadius = 5.0
        increaseBrightnessButton.layer.cornerRadius = 5.0
        setLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setLabels() {
        descriptionLabel.text = Localizable.string(for: LocalizedKey.Discoverability.accessibilityElementHiddenDescriptionBroken.key)
        titleLabel.text = Localizable.string(for: LocalizedKey.Discoverability.brightnessTitle.key)
        decreaseBrigthnessButton.accessibilityLabel = Localizable.string(for: LocalizedKey.Discoverability.decreaseBrightness.key)
        increaseBrightnessButton.accessibilityLabel = Localizable.string(for: LocalizedKey.Discoverability.increaseBrightness.key)
    }

    private func showPopUp() {
        UIView.animate(withDuration: 0.5, animations: {
            self.popUpView.alpha = 1.0
        })
        perform(#selector(hidePopUp), with: nil, afterDelay: 3.0)
    }

    @objc private func hidePopUp() {
        UIView.animate(withDuration: 0.5, animations: {
            self.popUpView.alpha = 0.0
        })
    }

    // MARK: - User actions
    @IBAction func decreaseBrightness(_ sender: Any) {
        UIScreen.main.brightness -= 0.1
        showPopUp()
    }

    @IBAction func increaseBrightness(_ sender: Any) {
        UIScreen.main.brightness += 0.1
        showPopUp()
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        popUpView.accessibilityElementsHidden = true
    }
}
