//
//  AccessibilityLanguageViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 02/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityLanguageViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var dutchButton: UIButton!
    @IBOutlet weak var frenchButton: UIButton!

    // MARK: - ViewController lifecycle events
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets the whole app to German language
        UIApplication.shared.accessibilityLanguage = "de-DE"

        // Sets the language per element
        explanationLabel.accessibilityLanguage = "en-EN"
        languageLabel.accessibilityLanguage = "nl-NL"
        dutchButton.accessibilityLanguage = "en-EN"
        frenchButton.accessibilityLanguage = "en-EN"
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Change back to English when leaving the screen
        UIApplication.shared.accessibilityLanguage = "en-EN"
    }

    // MARK: - User actions
    @IBAction func changeToDutch() {
        languageLabel.text = "Dit is een zin in het Nederlands"
        languageLabel.accessibilityLanguage = "nl-NL"
    }

    @IBAction func changeToFrench() {
        languageLabel.text = "C’est une phrase en français"
        languageLabel.accessibilityLanguage = "fr-FR"
    }

}
