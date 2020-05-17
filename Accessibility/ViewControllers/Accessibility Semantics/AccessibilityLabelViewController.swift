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
    @IBOutlet weak var barButtonDescriptionLabel: UILabel!
    @IBOutlet weak var songsDescriptionLabel: UILabel!
    @IBOutlet weak var songOneLabel: UILabel!
    @IBOutlet weak var songTwoLabel: UILabel!
    @IBOutlet weak var timeAndDateDescriptionLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var currencyDescriptionLabel: UILabel!
    @IBOutlet weak var currencyTitleLabel: UILabel!
    @IBOutlet weak var buySongOneButton: UIButton!
    @IBOutlet weak var buySongTwoButton: UIButton!
    @IBOutlet weak var songOneImageView: UIImageView!
    @IBOutlet weak var songTwoImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!

    var addButton: UIBarButtonItem? {
        get { return tabBarController?.navigationItem.rightBarButtonItem }
        set { tabBarController?.navigationItem.rightBarButtonItem = newValue }
    }

    // MARK: - Viewcontroller lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
        setUpLabels()
        if isAccessibilityFixed {
            setUpAccessibility()
        }
        dateLabel.text = getDateString(for: Date())
    }

    private func setUpNavigationBar() {
        addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        addButton?.accessibilityLabel = nil // to set back to default
    }

    private func setUpLabels() {
        buySongOneButton.setTitle(Localizable.string(for: LocalizedKey.AccessibilitySemantics.buyButtonTitle.key), for: .normal)
        buySongTwoButton.setTitle(Localizable.string(for: LocalizedKey.AccessibilitySemantics.buyButtonTitle.key), for: .normal)
        songOneLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.songOneTitle.key)
        songTwoLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.songTwoTitle.key)
        timeTitleLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.time.key)
        dateTitleLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.date.key)
        currencyTitleLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.currency.key)
        if isAccessibilityFixed {
            songsDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.imagesAndButtonsDescriptionFixed.key)
            barButtonDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.toolBarButtonDescriptionFixed.key)
            timeAndDateDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.timeAndDateDescriptionFixed.key)
            currencyDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.currencyDescriptionFixed.key)
        } else {
            songsDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.imagesAndButtonsDescriptionBroken.key)
            barButtonDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.toolBarButtonDescriptionBroken.key)
            timeAndDateDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.timeAndDateDescriptionBroken.key)
            currencyDescriptionLabel.text = Localizable.string(for: LocalizedKey.AccessibilitySemantics.currencyDescriptionBroken.key)
        }
    }

    // MARK: - Accessibility
    private func setUpAccessibility() {
        addButton?.accessibilityLabel = Localizable.string(for: Localizable.string(for: LocalizedKey.AccessibilitySemantics.addFavouriteAccessibilityLabel.key))

        buySongOneButton.accessibilityLabel = Localizable.string(for: Localizable.string(for: LocalizedKey.AccessibilitySemantics.buySongOneAccessibilityLabel.key))
        buySongTwoButton.accessibilityLabel = Localizable.string(for: LocalizedKey.AccessibilitySemantics.buySongTwoAccessibilityLabel.key)

        songOneImageView.isAccessibilityElement = true
        songOneImageView.accessibilityLabel = Localizable.string(for: LocalizedKey.AccessibilitySemantics.greenMusicalNote.key)

        songTwoImageView.isAccessibilityElement = true
        songTwoImageView.accessibilityLabel = Localizable.string(for: LocalizedKey.AccessibilitySemantics.yellowMusicalNote.key)

        timeLabel.accessibilityLabel = getTimeString(for: timeLabel?.text)
        currencyLabel.accessibilityLabel = getCurrencyString(for: 1500.50)
    }

    // MARK: - Helpers
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
