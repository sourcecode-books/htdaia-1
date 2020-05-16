//
//  PitchViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 02/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class PitchViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var highPitchLabel: UILabel!
    @IBOutlet weak var lowPitchLabel: UILabel!

    // MARK: - ViewController lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    private func setLabels() {
        highPitchLabel.text = Localizable.string(for: LocalizedKey.CustomizingSpeech.highPitch.key)
        lowPitchLabel.text = Localizable.string(for: LocalizedKey.CustomizingSpeech.lowPitch.key)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        guard
            let highPitchText = highPitchLabel.text,
            let lowPitchText = lowPitchLabel.text
        else { return }
        let highPitchString = NSAttributedString(
                string: highPitchText,
                attributes: [.accessibilitySpeechPitch : 2.0])
        highPitchLabel.accessibilityAttributedLabel = highPitchString
        let lowPitchString = NSAttributedString(
            string: lowPitchText,
            attributes: [.accessibilitySpeechPitch : 0.1])
        lowPitchLabel.accessibilityAttributedLabel = lowPitchString
    }
}
