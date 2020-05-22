//
//  AccessibilityPerformEscapeViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityPerformEscapeViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var showModalButton: UIButton!
    @IBOutlet weak var dimmedBackgroundView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionPopUpLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        closeButton.layer.cornerRadius = 5.0
        dimmedBackgroundView.alpha = 0
        popUpView.alpha = 0
        popUpView.layer.cornerRadius = 5.0
        showModalButton.layer.cornerRadius = 5.0
    }

    private func setLabels() {
        let key = isAccessibilityFixed ? LocalizedKey.AccessibilityAction.accessibilityPerformEscapeFixed.key : LocalizedKey.AccessibilityAction.accessibilityPerformEscapeBroken.key
        descriptionLabel.text = Localizable.string(for: key)
        showModalButton.setTitle(Localizable.string(for: LocalizedKey.AccessibilityAction.showModalButtonTitle.key), for: .normal)
        titleLabel.text = Localizable.string(for: LocalizedKey.AccessibilityAction.popUpTitle.key)
        descriptionPopUpLabel.text = Localizable.string(for: LocalizedKey.AccessibilityAction.popUpDescription.key)
        closeButton.setTitle(Localizable.string(for: LocalizedKey.AccessibilityAction.closeButtonTitle.key), for: .normal)
    }

    private func animatePopUpView(isVisible: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.dimmedBackgroundView.alpha = isVisible ? 1.0 : 0.0
            self.popUpView.alpha = isVisible ? 1.0 : 0.0
        }
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        if isAccessibilityFixed {
            popUpView.accessibilityViewIsModal = true
        }
    }

    override func accessibilityPerformEscape() -> Bool {
        if isAccessibilityFixed {
            close()
        }
        return true
    }

    // MARK: - User actions
    @IBAction func showModal() {
        animatePopUpView(isVisible: true)
    }

    @objc private func close() {
        animatePopUpView(isVisible: false)
    }
    
}
