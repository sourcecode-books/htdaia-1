//
//  AccessibilityTraitsViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 01/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityTraitsViewController: AccessibilityConfigurableViewController {

   // MARK: - IBOutlets
    @IBOutlet weak var header1Label: UILabel!
    @IBOutlet weak var header2Label: UILabel!
    @IBOutlet weak var textView1: UITextView! { didSet {
        textView1.text = "When VoiceOver users set the Rotor to 'header' they can jump from one element to another that has the .header trait. This speeds up navigation. Because tapping the button will leave the app and goes to a browser, we add the trait 'link'."
        textView1.delegate = self
        }}
    @IBOutlet weak var textView2: UITextView! { didSet {
        textView2.text = "When VoiceOver users set the Rotor to 'header' they can jump from one element to another that has the .header trait. This speeds up navigation. Because tapping the button will leave the app and goes to a browser, we add the trait 'link'."
        textView2.delegate = self
    }}
    @IBOutlet weak var button: UIButton!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        if isAccessibilityFixed {
            setUpAccessibility()
        }
    }

    // MARK: - User actions
    private func openURL() {
        let url = URL(string: "http://www.apple.com")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        header1Label.accessibilityTraits.insert(.header)
        header2Label.accessibilityTraits.insert(.header)
        button.accessibilityTraits.remove(.button)
        button.accessibilityTraits.insert(.link)
    }
}

extension AccessibilityTraitsViewController: UITextViewDelegate {
}
