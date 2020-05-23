//
//  LocalizedKey.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 16/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import Foundation

protocol KeyRepresentable where Self: RawRepresentable, RawValue == String {
    var key: String { get }
}

extension KeyRepresentable {
    var key: String { return self.rawValue }
}

enum LocalizedKey {
    enum IsAccessibilityElement: String, KeyRepresentable {
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
    }

    enum AccessibilitySemantics: String,KeyRepresentable {
        case toolBarButtonDescriptionBroken = "The toolbar button in the navigationBar speaks the name of the image or VoiceOver tries to guess what it means."
        case toolBarButtonDescriptionFixed = "Now the toolbar button has an accessibility label and is clearly spoken as 'Add favourite'."
        case imagesAndButtonsDescriptionBroken = "Images are not spoken by default. The image name is spoken or VoiceOver tries to guess. Also the buttons are not uniquely identifiable."
        case imagesAndButtonsDescriptionFixed = "Both images are now accessible and have an accessibility label that describes what's in the image. The buy buttons have accessibility labels that make them uniquely identifiable."
        case songOneTitle = "Song One"
        case songTwoTitle = "Song Two"
        case buyButtonTitle = "Buy"
        case timeAndDateDescriptionBroken = "Time is read as numbers."
        case timeAndDateDescriptionFixed = "Time is read correctly."
        case currencyDescriptionBroken = "Currency is not spoken correctly."
        case currencyDescriptionFixed = "Currency is read correctly."
        case addFavouriteAccessibilityLabel = "Add favourite"
        case buySongOneAccessibilityLabel = "Buy Song One"
        case buySongTwoAccessibilityLabel = "Buy Song Two"
        case greenMusicalNote = "Green musical note"
        case yellowMusicalNote = "Yellow musical note"
        case time = "Time"
        case date = "Date"
        case currency = "Currency"

        case hintDescriptionBroken = "It is not clear for the user what exactly happens if the download button is pressed. Also, the buttons are not described well."
        case hintDescriptionFixed = "The download button now has an accessibility hint that starts with a verb and tells the outcome of performing the action."
        case selectDocument = "Select document"
        case downloadButtonHint = "Downloads the selected documents."

        case dailyLimit = "Daily Limit"
    }

    enum CustomizingSpeech: String, KeyRepresentable {
        case highPitch = "This label is spoken with a high pitch."
        case lowPitch = "This label is spoken with a low pitch."
        case punctuation = "Swift: if result == 3 { print('Correct') }"
        case spellOut = "+31-6-12345xxx\nNL17ABNA00012345xx"
        case language = "The french man said: 'Bonjour!'"
        case phonetic = "The broadcast is live."
    }

    enum Discoverability: String, KeyRepresentable {
        case brightnessTitle = "Brightness."
        case accessibilityElementHiddenDescriptionBroken = "This view is a transient view that doesn't need to be spoken. The aural feedback and button context is enough. But the label of the pop-up view is still accessible."
        case accessibilityElementHiddenDescriptionFixed = "With accessibilityElementsHidden you can hide all the child elements for the assistive technologies. Same as setting isAccessibilityElement to false on each child element."
        case decreaseBrightness = "Decrease brightness."
        case increaseBrightness = "Increase brightness."
        case accessibilityViewIsModalBroken = "This text should not be accessible once you open the pop-up view. However with custom views, the content beneath will still be accessible. This confuses the VoiceOver user because the context is not clear."
        case accessibilityViewIsModalFixed = "With accessibilityViewIsModal you make elements of sibling views inaccessible. The focus stays on the pop-up view and VoiceOver users can not reach the content below the pop-up view."
        case showModalButtonTitle = "Show Modal"
        case popUpTitle = "You Are On Fire!"
        case popUpDescription = "The assistive technology should focus on this bottom sheet to provide the right context."
        case closeButtonTitle = "Close"
    }

    enum FocusArea: String, KeyRepresentable {
        case focusAreaTitle = "Focus Area"
        case accessibilityFrameDescription = "The accessibility frame and path need to be set to the view's frame in on-screen coordinates."
        case accessibilityFrameButtonTitle = "Focus on me with VoiceOver on"
        case scrollViewTitle = "Scroll View"
        case scrollViewLabelTop = "Pay special attention to scroll views where it might seem to work at first, but as soon as you scroll, the highlight does not follow the element."
        case scrollViewLabelBottom = "You can fix this by updating the accessibilityPath in the delegate function of the UIScrollView: scrollViewDidScroll(_ scrollView: UIScrollView)./n/nIn general you need to update the accessibilityFrame or accessibilityPath if the view’s frame changes after the view is initialized. You can also override the accessibilityPath of an element that inherits from a UIView./n/n An accessibility element needs an accessibilityPath to become focusable by assistive technologies like VoiceOver."
        case scrollViewButtonTitle = "Scroll and check my focus"
        case colorModePreference = "Color mode preference"
        case accessibilityActivationPointBroken = "The label is separate from the paint button. To make it one clickable element you can put both the label and button in a container and make it accessible. But the activation point will be on the center of the container by default."
        case accessibilityActivationPointFixed
    }

    enum GroupingAndOrder: String, KeyRepresentable {
        case name = "Name:"
        case email = "Email:"
        case person = "Jeroen de Vrind"
        case emailPerson = "email@me.com"
    }

    enum AccessibilityAction: String, KeyRepresentable {
        case accessibilityPerformEscapeBroken = "UINavigationBar has accessibilityPerformEscape() baked in. If the VoiceOver user makes a Z-sign with 2 fingers the view will pop off the stack. But a custom modal will not close."
        case accessibilityPerformEscapeFixed = "By implementing accessibilityPerformEscape() the VoiceOver user can close screens by making a Z-sign with 2 fingers. The custom modal will now close."
        case showModalButtonTitle = "Show modal"
        case popUpTitle = "Escape the screen!"
        case popUpDescription = "Don't press the close button, but make a Z-gesture with two fingers to close it."
        case closeButtonTitle = "Close"
        case magicTapDescription = "By performing a double tap with 2 fingers, VoiceOver users can toggle between the main actions of a particular screen. In this case playing and pausing the animation."
        case pauseAnimation = "pause animation"
        case playAnimation = "play animation"
        case purpleBoxAnimating = "Purple box is growing smaller and bigger repeatedly."
        case purpleBox = "Purple box."
    }

    enum Notifications: String, KeyRepresentable {
        case loading = "Loading"
        case completed = "Completed"
        case start = "Start"
    }

    enum DynamicType: String, KeyRepresentable {
        case titleOne = "This is title one"
        case titleTwo = "This is title two"
        case titleThree = "This is title three"
        case descriptionCell = "This is the description for the tableview cell. When the text grows the cell should expand."
        case mailHasBeenSent = "A mail has been sent"
        case mailHasBeenSentDescription = "Check your mail and activate your account by clicking the link."
    }
}
