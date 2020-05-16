//
//  AccessibilityViewIsModalViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityViewIsModalViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var showModalButton: UIButton!

    private lazy var bottomSheetTransitioningDelegate: UIViewControllerTransitioningDelegate = {
        return BottomSheetTransitioningDelegate()
    }()

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }

    private func setLabels() {
        descriptionLabel.text = "The text that is now in this view, should not be accessible once you open the modal screen. However with custom views, the content beneath will still be accessible. This confuses the VoiceOver user because the context is not clear."
        showModalButton.setTitle("Show Modal", for: .normal)
    }

    // MARK: - User actions
    @IBAction func showModal() {
        let viewController = ModalSheetViewController()
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = bottomSheetTransitioningDelegate

        // MARK: - Accessibility
        if isAccessibilityFixed {
            viewController.accessibilityViewIsModal = true
        }

        present(viewController, animated: true)
    }
}
