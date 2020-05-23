//
//  AccessibilityDecrementAndIncrementViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityDecrementAndIncrementViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemsStackView: UIStackView!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = [Localizable.string(for: LocalizedKey.AccessibilityAction.peanutButter.key),
        Localizable.string(for: LocalizedKey.AccessibilityAction.cheese.key)]
        descriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilityAction.adjustableDescription.key)
        items.forEach { (itemName) in
            if let itemView = Bundle.main.loadNibNamed("AccessibleStepper", owner: self, options: nil)?.first as? AccessibleStepper {
                itemView.itemName = itemName
                itemView.isAccessibilityFixed = isAccessibilityFixed
                itemsStackView.addArrangedSubview(itemView)
            }
        }
    }

    // MARK: - Accessibility

    // MARK: - User actions

}
