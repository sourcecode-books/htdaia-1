//
//  DynamicTableViewCell.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 22/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Configuration
    func configure(with viewModel: DynamicTypeViewModel) {
        cellImageView.image = UIImage(systemName: viewModel.imageName)
        titleLabel.text = Localizable.string(for: viewModel.title)
        descriptionLabel.text = Localizable.string(for: viewModel.description)
    }

    func setUpAccessibility() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping

        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
}
