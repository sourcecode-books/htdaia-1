//
//  PunctuationViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class PunctuationViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var punctuationLabel: UILabel!

    // MARK: - ViewController lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setLabels() {
        punctuationLabel.text = Localizable.string(for: LocalizedKey.CustomizingSpeech.punctuation.key)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        guard
            let text = punctuationLabel.text
        else { return }
        let attributedString = NSMutableAttributedString(
            string: text,
            attributes: [.accessibilitySpeechPunctuation : 0.1])
        punctuationLabel.accessibilityAttributedLabel = attributedString
    }
}
