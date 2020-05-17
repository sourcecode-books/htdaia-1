//
//  AccessibilityValueViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 02/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibleSlider: UISlider {
    private var stepSize: Float = 250
    private var numberFormatter: NumberFormatter?
    private var isFixed: Bool = false

    func configure(title: String, minimumValue: Float, maximumValue: Float, stepSize: Float, initialValue: Float, numberFormatter: NumberFormatter, isFixed: Bool) {
        self.stepSize = stepSize
        self.numberFormatter = numberFormatter
        self.isContinuous = true
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.isFixed = isFixed
        value = initialValue
        if isFixed {
            accessibilityLabel = title
            accessibilityValue = readableValue()
        }
    }

    func readableValue() -> String {
        let newValue = roundf(value / stepSize)
        value = newValue * stepSize
        let sliderValueString = numberFormatter?.string(from: NSNumber(value: value))

        return sliderValueString ?? ""
    }

    override func accessibilityIncrement() {
        value += stepSize
        if isFixed {
            accessibilityValue = readableValue()
        }
        sendActions(for: .valueChanged)
    }

    override func accessibilityDecrement() {
        value -= stepSize
        if isFixed {
            accessibilityValue = readableValue()
        }
        sendActions(for: .valueChanged)
    }
}

final class AccessibilityValueViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dailyLimitLabel: UILabel!
    @IBOutlet weak var slider: AccessibleSlider!

    // MAR: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.dailyLimit.key)
        dailyLimitLabel.text = slider?.readableValue()
        configureAccessibleSlider()
    }

    private func configureAccessibleSlider() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.usesGroupingSeparator = false
        slider.configure(title: Localizable.string(for: LocalizedKey.AccessibilitySemantics.dailyLimit.key),
                         minimumValue: 500.0,
                         maximumValue: 5000.0,
                         stepSize: 500.0,
                         initialValue: 2500.0,
                         numberFormatter: numberFormatter,
                         isFixed: isAccessibilityFixed)
        dailyLimitLabel.text = slider?.readableValue()
        if isAccessibilityFixed {
            titleLabel.isAccessibilityElement = false
            dailyLimitLabel.isAccessibilityElement = false
        }
    }

    // MARK: - User actions
    @IBAction func sliderValueChanged() {
        dailyLimitLabel.text = slider?.readableValue()
    }
}
