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
    @IBOutlet weak var phoneticLabel: UILabel! {
        didSet {
            guard let text = phoneticLabel.text else { return }
            let attributedString = NSMutableAttributedString(string: text)
            let range = attributedString.string.range(of: "live")!
            attributedString.addAttributes([
                .accessibilitySpeechIPANotation: "laɪv"],
                range: NSRange(range, in: attributedString.string))
            phoneticLabel.accessibilityAttributedLabel = attributedString
        }
    }
}
