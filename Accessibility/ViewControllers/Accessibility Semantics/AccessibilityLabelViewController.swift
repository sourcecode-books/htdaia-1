//
//  AccessibilityLabelViewController.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 27/04/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import UIKit

final class AccessibilityLabelViewController: AccessibilityConfigurableViewController {

    // MARK: - Outlets
    @IBOutlet weak var buySongOneButton: UIButton!
    @IBOutlet weak var buySongTwoButton: UIButton!
    @IBOutlet weak var songOneImageView: UIImageView!
    @IBOutlet weak var songTwoImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!

    // MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpAccessibility()
        dateLabel.text = getDateString(for: Date())
    }

    private func setUpNavigationBar() {
        tabBarController?.title = Localizable.string(for: "Favourites")
        let image = UIImage(named: "core_icon_add")

        // Fix the navigationBar button by providing  label or use the system Add-button
        // UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let addButton = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        addButton.accessibilityLabel = Localizable.string(for: "Add favourite")
        tabBarController?.navigationItem.rightBarButtonItem = addButton
    }

    private func setUpAccessibility() {
        // Fix to identify which buy button the user is focusing on
        buySongOneButton.accessibilityLabel = Localizable.string(for: "Buy Song One")
        buySongTwoButton.accessibilityLabel = Localizable.string(for: "Buy Song Two")

        // Fix to provide an image discription
        // Because imageViews are not accessible by default in UIKit, we first have to set isAccessibilityElement to true to make them accessible
        songOneImageView.isAccessibilityElement = true
        songOneImageView.accessibilityLabel = Localizable.string(for: "Green musical note")
        songTwoImageView.isAccessibilityElement = true
        songTwoImageView.accessibilityLabel = Localizable.string(for: "Yellow musical note")

        timeLabel.accessibilityLabel = getTimeString(for: timeLabel?.text)
        currencyLabel.accessibilityLabel = getCurrencyString(for: 1500.50)

    }

    private func getTimeString(for timeString: String?) -> String? {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "mm:ss"
        if let timeString = timeString, let date = timeFormatter.date(from: timeString) {
            let components = Calendar.current.dateComponents([.minute, .second], from: date)
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .short
            return formatter.string(from: components)
        }
        return nil
    }

    private func getDateString(for date: Date) -> String? {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    private func getCurrencyString(for price: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = false
        formatter.locale = Locale(identifier: "en_CA")

        return formatter.string(from: NSNumber(value: price))
    }
}
