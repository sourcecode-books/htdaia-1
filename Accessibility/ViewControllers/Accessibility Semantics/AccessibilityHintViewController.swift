//
//  AccessibilityHintViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 01/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityHintViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var checkboxButtons: [UIButton]!
    @IBOutlet weak var downloadButton: UIButton!

    // MARK: - ViewController lifecycle events
    override func viewDidLoad() {
        super.viewDidLoad()
        let key = isAccessibilityFixed ? LocalizedKey.AccessibilitySemantics.hintDescriptionFixed.key : LocalizedKey.AccessibilitySemantics.hintDescriptionBroken.key
        descriptionLabel.text = Localizable.string(for: key)
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        checkboxButtons.forEach { (button) in
            button.accessibilityLabel = Localizable.string(for: LocalizedKey.AccessibilitySemantics.selectDocument.key)
        }
        downloadButton.accessibilityHint = Localizable.string(for: LocalizedKey.AccessibilitySemantics.downloadButtonHint.key)
    }

    private func updateAccessibility(_ sender: UIButton) {
        if sender.isSelected {
            sender.accessibilityTraits.insert(.selected)
        } else {
            sender.accessibilityTraits.remove(.selected)
        }
    }

    // MARK: - User actions
    @IBAction func toggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        if isAccessibilityFixed { updateAccessibility(sender) }
        let image = UIImage(systemName: sender.isSelected ? "checkmark.square" : "square")
        sender.setImage(image, for: .normal)
    }
}
