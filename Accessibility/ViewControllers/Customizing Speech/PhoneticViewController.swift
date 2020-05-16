//
//  PhoneticViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class PhoneticViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var phoneticLabel: UILabel!

    // MARK: - ViewController lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setLabels() {
        phoneticLabel.text = Localizable.string(for: LocalizedKey.CustomizingSpeech.phonetic.key)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        guard
            let text = phoneticLabel.text
        else { return }
        let attributedString = NSMutableAttributedString(string: text)
        print(text)
        let range = attributedString.string.range(of: "live")!
        attributedString.addAttributes([
            .accessibilitySpeechIPANotation: "laɪv"],
            range: NSRange(range, in: attributedString.string))
        phoneticLabel.accessibilityAttributedLabel = attributedString
    }
}
