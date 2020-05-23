//
//  AccessibleStepper.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 23/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

class AccessibleStepper: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemStepper: UIStepper! {
        didSet {
            itemStepper.stepValue = 1
            itemStepper.minimumValue = 0
            itemStepper.maximumValue = 10
        }
    }
    @IBOutlet weak var itemAmountLabel: UILabel!

    // MARK: - Properties
    var isAccessibilityFixed: Bool = false
    var itemName: String? {
        didSet {
            itemLabel.text = itemName
        }
    }

    // MARK: - Accessibility
    override var isAccessibilityElement: Bool {
        get { return isAccessibilityFixed }
        set {}
    }

    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            if isAccessibilityFixed { return [.adjustable] }
            return []
        }
        set {}
    }

    override var accessibilityValue: String? {
        get {
            if isAccessibilityFixed {
                guard let itemName = itemName else { return nil }
                let format = Localizable.string(for: LocalizedKey.AccessibilityAction.numberOfItems.key)
                let message = String.localizedStringWithFormat(format, Int(itemStepper.value))
                return "\(message) of \(itemName)"
            }
            return nil
        }
        set {}
    }

    override func accessibilityIncrement() {
        itemStepper.value += itemStepper.stepValue
        itemStepper.sendActions(for: .valueChanged)
    }

    override func accessibilityDecrement() {
        itemStepper.value -= itemStepper.stepValue
        itemStepper.sendActions(for: .valueChanged)
    }

    // MARK: - User actions
    @IBAction func updateAmount(_ sender: UIStepper) {
        itemAmountLabel.text = String(Int(itemStepper.value))
    }
}
