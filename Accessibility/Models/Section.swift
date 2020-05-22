//
//  Section.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 08/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import Foundation

protocol Item {
    var title: String { get }
    var nibName: String { get }
}

extension Item where Self: RawRepresentable, RawValue == String {
    var title: String { return self.rawValue }

    var nibName: String {
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        let viewControllerName = self.rawValue.filter { !" ".contains($0) }
        return "\(appName).\(viewControllerName)ViewController"
    }
}

struct SectionGroup {
    let section: Section
    let items: [Item]
}

enum Section: String {
    case accessibilityElement = "Accessibility Element"
    case accessibilitySemantics = "Accessibility Semantics"
    case customizingSpeech = "Customizing Speech"
    case discoverability = "Discoverability"
    case focusArea = "Focus Area"
    case groupingAndOrder = "Grouping And Order"
    case accessibilityAction = "Accessibility Action"
    case notifications = "Notifications"
    case dynamicType = "Dynamic Type"
}

enum AccessibilityElement: String, Item {
    case isAccessibilityElement = "Is Accessibility Element"
    case customElements = "Custom Elements"
}

enum AccessibilitySemantics: String, Item {
    case accessibilityLabel = "Accessibility Label"
    case accessibilityHint = "Accessibility Hint"
    case accessibilityTraits = "Accessibility Traits"
    case accessibilityValue = "Accessibility Value"
    case accessibilityLanguage = "Accessibility Language"
}

enum CustomizingSpeech: String, Item {
    case pitch = "Pitch"
    case punctuation = "Punctuation"
    case spellOut = "Spell Out"
    case language = "Language"
    case phonetic = "Phonetic"
}

enum Discoverability: String, Item {
    case accessibilityElementsHidden = "Accessibility Elements Hidden"
    case accessibilityViewIsModal = "Accessibility View Is Modal"
}

enum FocusArea: String, Item {
    case accessibilityFrame = "Accessibility Frame"
    case accessibilityFrameScrollView = "AccessibilityFrame ScrollView"
    case accessibilityFrameNotOverlapping = "Frames Not Overlapping"
    case accessibilityActivationPoint = "Accessibility Activation Point"
}

enum GroupingAndOrder: String, Item {
    case accessibilityElements = "Accessibility Elements"
    case groupViews = "Group Views"
    case shouldGroupAccessibilityChildren = "Should Group Accessibility Children"
    case accessibilityNavigationStyle = "Accessibility Navigation Style"
}

enum AccessibilityAction: String, Item {
    case accessibilityActivate = "Accessibility Activate"
    case accessibilityCustomAction = "Accessibility Custom Action"
    case accessibilityDecrementAndIncrement = "Accessibility Decrement And Increment"
    case accessibilityPerformEscape = "Accessibility Perform Escape"
    case accessibilityPerformMagicTap = "Accessibility Perform Magic Tap"
    case accessibilityScroll = "Accessibility Scroll"
}

enum Notifications: String, Item {
    case screenChanged = "Screen Changed"
    case layoutChanged = "Layout Changed"
    case pageScrolled = "Page Scrolled"
    case announcement = "Announcement"
    case announcementDidFinish = "Announcement Did Finish"
}

enum DynamicType: String, Item {
    case dynamicLabelsTableView = "Dynamic Labels Table View"
    case dynamicImages = "Dynamic Images"
    case largeContentViewer = "Large Content Viewer"
}
