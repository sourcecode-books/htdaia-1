//
//  AccessibilityFrameScrollViewViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 26/04/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityFrameScrollViewViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var scrollViewTitle: UILabel!
    @IBOutlet weak var scrollViewLabelTop: UILabel!
    @IBOutlet weak var scrollViewLabelBottom: UILabel!
    @IBOutlet weak var scrollViewButton: UIButton!

    // MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollViewButton.accessibilityPath = UIBezierPath(rect: view.convert(scrollViewButton.frame, from: scrollViewButton.superview!))
    }

    private func setUpLabels() {
        scrollViewTitle.text = Localizable.string(for: LocalizedKey.FocusArea.scrollViewTitle.key)
        scrollViewLabelTop.text = Localizable.string(for: LocalizedKey.FocusArea.scrollViewLabelTop.key)
        scrollViewLabelBottom.text = Localizable.string(for: LocalizedKey.FocusArea.scrollViewLabelBottom.key)
            scrollViewButton.setTitle(Localizable.string(for: LocalizedKey.FocusArea.scrollViewButtonTitle.key), for: .normal)
    }

    // MARK: - Accessibility
    private func updateAccessibility() {
        scrollViewButton.accessibilityPath = UIBezierPath(rect: view.convert(scrollViewButton.frame, from: scrollViewButton.superview!))
    }
}

// MARK: - UIScrollView delegate
extension AccessibilityFrameScrollViewViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isAccessibilityFixed {
            updateAccessibility()
        }
    }
}
