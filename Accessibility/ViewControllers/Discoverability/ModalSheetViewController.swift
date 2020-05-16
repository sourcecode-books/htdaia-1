//
//  ModalSheetViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 16/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

class ModalSheetViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!


    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }

    private func setLabels() {
        titleLabel.text = "You Are On Fire!"
        descriptionLabel.text = "The assistive technology should focus on this bottom sheet to provide the right context. Instead everything behind the sheet is still accessible."
        closeButton.setTitle("Close", for: .normal)
    }

    // MARK: - User actions
    @objc private func close() {
        presentingViewController?.dismiss(animated: true)
    }
}
