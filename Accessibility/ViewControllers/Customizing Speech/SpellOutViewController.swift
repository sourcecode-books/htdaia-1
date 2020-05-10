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
    @IBOutlet weak var spellOutLabel: UILabel! {
        didSet {
            guard let text = spellOutLabel.text else { return }
            let attributedString = NSMutableAttributedString(string: text,
            attributes: [.accessibilitySpeechSpellOut : true])
            spellOutLabel.accessibilityAttributedLabel = attributedString
        }
    }
}
