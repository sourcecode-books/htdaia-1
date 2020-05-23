//
//  AccessibilityPerformMagicTapViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityPerformMagicTapViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilityAction.magicTapDescription.key)
        }
    }
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var purpleBox: UIView!

    // MARK: - Properties
    var isAnimating: Bool = false

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAccessibility()
    }

    // MARK: - Accessibility
    override func accessibilityPerformMagicTap() -> Bool {
        if isAccessibilityFixed {
            toggle()
        }
        return true
    }

    private func updateAccessibility() {
        if isAccessibilityFixed {
            let key = isAnimating ? LocalizedKey.AccessibilityAction.pauseAnimation.key : LocalizedKey.AccessibilityAction.playAnimation.key
            playPauseButton.accessibilityLabel = Localizable.string(for: key)

            purpleBox.isAccessibilityElement = true
            let purpleBoxKey = isAnimating ? LocalizedKey.AccessibilityAction.purpleBoxAnimating.key : LocalizedKey.AccessibilityAction.purpleBox.key
            purpleBox.accessibilityLabel = Localizable.string(for: purpleBoxKey)
        }
    }

    // MARK: - User actions
    @IBAction func toggle() {
        isAnimating.toggle()

        let imageName = isAnimating ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: imageName), for: .normal)

        // Update accessibility labels
        updateAccessibility()

        animatePurpleBox()
    }

    private func animatePurpleBox() {
        if isAnimating {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                self.purpleBox.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.purpleBox.transform = .identity
            }
        }
    }
}
