//
//  AnnouncementViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AnnouncementViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            stackView.isHidden = true
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.setTitle(Localizable.string(for: LocalizedKey.Notifications.start.key), for: .normal)
        }
    }
    @IBOutlet weak var loadingLabel: UILabel! {
        didSet {
            loadingLabel.text = Localizable.string(for: LocalizedKey.Notifications.loading.key)
        }
    }

    // MARK: - User actions
    @IBAction func start() {
        view.isUserInteractionEnabled = false
        stackView.isHidden = false
        activityIndicator.startAnimating()
        perform(#selector(stop), with: nil, afterDelay: 3)
        if isAccessibilityFixed {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                 let announcement = NSAttributedString(string: Localizable.string(for: LocalizedKey.Notifications.loading.key), attributes: [.accessibilitySpeechQueueAnnouncement: true])
                           UIAccessibility.post(notification: .announcement, argument: announcement)
            }
        }
    }

    @objc private func stop() {
        if isAccessibilityFixed {
            let announcement = NSAttributedString(string: Localizable.string(for: LocalizedKey.Notifications.completed.key), attributes: [.accessibilitySpeechQueueAnnouncement: true])
            UIAccessibility.post(notification: .announcement, argument: announcement)
        }
        stackView.isHidden = true
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
