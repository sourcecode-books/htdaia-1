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
    @IBOutlet weak var highPitchLabel: UILabel! {
        didSet {
            guard let text = highPitchLabel.text else { return }
            let attributedString = NSAttributedString(
                string: text,
                attributes: [.accessibilitySpeechPitch : 2.0])
            highPitchLabel.accessibilityAttributedLabel = attributedString
        }
    }
    
    @IBOutlet weak var lowPitchLabel: UILabel! {
        didSet {
            guard let text = lowPitchLabel.text else { return }
            let attributedString = NSAttributedString(
                string: text,
                attributes: [.accessibilitySpeechPitch : 0.1])
            lowPitchLabel.accessibilityAttributedLabel = attributedString
        }
    }
}
