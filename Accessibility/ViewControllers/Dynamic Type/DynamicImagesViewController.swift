//
//  DynamicImagesViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 10/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class DynamicImagesViewController: AccessibilityConfigurableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var preferredFontLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    // MARK: - Constants
    let defaultHeightValue: CGFloat = 100.0

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
        titleLabel.text = Localizable.string(for: LocalizedKey.DynamicType.mailHasBeenSent.key)
        descriptionLabel.text = Localizable.string(for: LocalizedKey.DynamicType.mailHasBeenSentDescription.key)
        button.setTitle(Localizable.string(for: "Close"), for: .normal)
        preferredFontLabel.text = "\(UITraitCollection.current.preferredContentSizeCategory.rawValue)"
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        preferredFontLabel.text = "\(traitCollection.preferredContentSizeCategory.rawValue)"
        let isAccessibilityCategory = traitCollection.preferredContentSizeCategory.isAccessibilityCategory
        if isAccessibilityCategory != previousTraitCollection?.preferredContentSizeCategory.isAccessibilityCategory {
            let adjustedHeight = UIFontMetrics.default.scaledValue(for: defaultHeightValue)
            heightConstraint.constant = adjustedHeight
        }
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        // It is important that you also set the right constraints. If you would set a horizontal center constraint on the label, be aware that text can get off-screen. That's why it's better to set leading and trailing constraints.

        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .body)
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true

        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping

        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping

        preferredFontLabel.font = UIFont.preferredFont(forTextStyle: .body)
        preferredFontLabel.adjustsFontForContentSizeCategory = true
        preferredFontLabel.numberOfLines = 0
        preferredFontLabel.lineBreakMode = .byWordWrapping

        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
    }
}
