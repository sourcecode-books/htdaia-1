//
//  ShouldGroupAccessibilityChildrenViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class ShouldGroupAccessibilityChildrenViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameContainerView: UIStackView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailContainerView: UIStackView!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
        setUpLabels()
    }

    private func setUpLabels() {
        nameTitleLabel.text = Localizable.string(for: LocalizedKey.GroupingAndOrder.name.key)
        nameLabel.text = Localizable.string(for: LocalizedKey.GroupingAndOrder.person.key)
        emailTitleLabel.text = Localizable.string(for: LocalizedKey.GroupingAndOrder.email.key)
        emailLabel.text = Localizable.string(for: LocalizedKey.GroupingAndOrder.emailPerson.key)
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        nameContainerView.shouldGroupAccessibilityChildren = true
        emailContainerView.shouldGroupAccessibilityChildren = true
    }
}
