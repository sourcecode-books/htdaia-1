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
    @IBOutlet var checkboxButtons: [UIButton]!
    @IBOutlet weak var downloadButton: UIButton! {
        didSet {
            downloadButton.accessibilityHint = "Downloads the selected documents."
        }
    }

    // MARK: - ViewController lifecycle events
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxButtons.forEach { (button) in
            button.accessibilityLabel = "Select document"
        }
    }

    // MARK: - User actions
    @IBAction func toggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.accessibilityTraits.insert(.selected)
        } else {
            sender.accessibilityTraits.remove(.selected)
        }
        let image = UIImage(systemName: sender.isSelected ? "checkmark.square" : "square")
        sender.setImage(image, for: .normal)
    }
}
