//
//  LanguageViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class LanguageViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var languageLabel: UILabel! {
        didSet {
            guard let text = languageLabel.text else { return }
            let attributedString = NSMutableAttributedString(string: text)
            let range = attributedString.string.range(of: "Bonjour")!
            attributedString.addAttributes([
                .accessibilitySpeechLanguage: "fr-FR"],
                range: NSRange(range, in: attributedString.string))
            languageLabel.accessibilityAttributedLabel = attributedString
        }
    }
}
