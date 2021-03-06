//
//  SpellOutViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class SpellOutViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var spellOutLabel: UILabel! 

    // MARK: - ViewController lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setLabels() {
        spellOutLabel.text = Localizable.string(for: LocalizedKey.CustomizingSpeech.spellOut.key)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        guard
            let text = spellOutLabel.text
        else { return }
        let attributedString = NSMutableAttributedString(
            string: text,
            attributes: [.accessibilitySpeechSpellOut : true])
            spellOutLabel.accessibilityAttributedLabel = attributedString
    }
}
