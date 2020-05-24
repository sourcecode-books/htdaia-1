//
//  AccessibilityActivateViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

class ActionableImageView: UIImageView {

    // MARK: - Properties
    var isAccessibilityFixed: Bool = false

    // MARK: - Accessibility
    override func accessibilityActivate() -> Bool {
        tintColor = .red
        return true
    }
}

final class AccessibilityActivateViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilityAction.accessibilityActivateDescription.key)
        }
    }
    @IBOutlet weak var imageView: ActionableImageView! {
        didSet {
            if isAccessibilityFixed {
                imageView.isAccessibilityElement = true
                imageView.accessibilityTraits = [.button]
            }
            imageView.isAccessibilityFixed = isAccessibilityFixed
        }
    }
}
