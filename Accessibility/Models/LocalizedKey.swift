//
//  LocalizedKey.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 16/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import Foundation

enum LocalizedKey {
    enum IsAccessibilityElement: String {
        case defaultTitle = "No isAccessibilityElement set by default"
        case defaultDescriptionBroken = "An UIImageView is not accessible by default in UIKit:"
        case defaultDescriptionFixed = "Setting isAccessibilityElement to true makes it accessible:"
        case containerTitle = "Effect on child views of container view"
        case containerDescriptionBroken = "In this container UIView elements are individually accessible when isAccessibilyElement is false:"
        case containerDescriptionFixed = "Setting isAccessibilityElement to true on a container view, will set it to false on the child views:"
        case accountNumberTitle = "AccountNumber:"
        case accountNumber = "NL12 ABNA 1234567890"
        case amount = "€250,00"
        case customViewsTitle = "Custom Views"
        case customViewsDescriptionBroken = "Custom views have no accessibility properties or have isAccessibilityElement set to false by default:"
        case customViewsDescriptionFixed = "If the custom view inherits from UIView, set isAccessibilityElement to true:"

        var key: String { return self.rawValue }
    }

    enum CustomizingSpeech: String {
        case highPitch = "This label is spoken with a high pitch."
        case lowPitch = "This label is spoken with a low pitch."
        case punctuation = "Swift: if result == 3 { print('Correct') }"
        case spellOut = "+31-6-12345xxx\nNL17ABNA00012345xx"
        case language = "The french man said: 'Bonjour!'"
        case phonetic = "The broadcast is live."

        var key: String { return self.rawValue }
    }

    enum Discoverability: String {
        case brightnessTitle = "Brightness."
        case accessibilityElementHiddenDescriptionBroken = "This view is a transient view that doesn't need to be spoken. The aural feedback and button context is enough. But the label of the pop-up view is still accessible."
        case accessibilityElementHiddenDescriptionFixed = "With accessibilityElementsHidden you can hide all the child elements for the assistive technologies. Same as setting isAccessibilityElement to false on each child element."
        case decreaseBrightness = "Decrease brightness."
        case increaseBrightness = "Increase brightness."
        var key: String { return self.rawValue }
    }
}
