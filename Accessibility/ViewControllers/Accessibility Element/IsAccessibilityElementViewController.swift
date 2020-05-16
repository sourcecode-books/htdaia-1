//
//  IsAccessibilityElementViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class IsAccessibilityElementViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var defaultTitleLabel: UILabel! { didSet {
        defaultTitleLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.defaultTitle.key)
        }}
    @IBOutlet weak var defaultDescriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerTitleLabel: UILabel! { didSet {
        containerTitleLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.containerTitle.key)
        }}
    @IBOutlet weak var containerDescriptionLabel: UILabel!
    @IBOutlet weak var accountNumberTitleLabel: UILabel! { didSet {
    accountNumberTitleLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.accountNumberTitle.key)
    }}
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var accountNumberLabel: UILabel! { didSet {
    accountNumberLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.accountNumber.key)
    }}
    @IBOutlet weak var amountLabel: UILabel! { didSet {
    amountLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.amount.key)
    }}
    @IBOutlet weak var customViewsTitleLabel: UILabel! { didSet {
    customViewsTitleLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.customViewsTitle.key)
    }}
    @IBOutlet weak var customViewsDescriptionLabel: UILabel!
    @IBOutlet weak var customView: CustomView!

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
        setLabels()
    }

    private func setLabels() {
        if isAccessibilityFixed {
            defaultDescriptionLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.defaultDescriptionFixed.key)
            containerDescriptionLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.containerDescriptionFixed.key)
            customViewsDescriptionLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.customViewsDescriptionFixed.key)
        } else {
            defaultDescriptionLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.defaultDescriptionBroken.key)
            containerDescriptionLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.containerDescriptionBroken.key)
            customViewsDescriptionLabel.text = Localizable.string(for: LocalizedKey.IsAccessibilityElement.customViewsDescriptionBroken.key)
        }
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        imageView.isAccessibilityElement = true
        containerView.isAccessibilityElement = true
        customView.isAccessibilityElement = true
    }
}
