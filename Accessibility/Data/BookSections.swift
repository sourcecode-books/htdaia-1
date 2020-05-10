//
//  BookSections.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 09/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import Foundation

let bookSections = [
    SectionGroup(section: .accessibilityElement,
                 items: [AccessibilityElement.isAccessibilityElement,
                         AccessibilityElement.customElements]),

    SectionGroup(section: .accessibilitySemantics,
                 items: [AccessibilitySemantics.accessibilityLabel,
                         AccessibilitySemantics.accessibilityHint,
                         AccessibilitySemantics.accessibilityTraits,
                         AccessibilitySemantics.accessibilityValue,
                         AccessibilitySemantics.accessibilityLanguage]),

    SectionGroup(section: .customizingSpeech,
                 items: [CustomizingSpeech.pitch,
                         CustomizingSpeech.punctuation,
                         CustomizingSpeech.spellOut,
                         CustomizingSpeech.language,
                         CustomizingSpeech.phonetic]),

    SectionGroup(section: .discoverability,
                 items: [Discoverability.accessibilityElementsHidden,
                        Discoverability.accessibilityViewIsModal]),

    SectionGroup(section: .focusArea,
                 items: [FocusArea.accessibilityFrame,
                        FocusArea.accessibilityFrameScrollView,
                        FocusArea.accessibilityFrameNotOverlapping,
                        FocusArea.accessibilityActivationPoint]),

    SectionGroup(section: .groupingAndOrder,
                 items: [GroupingAndOrder.accessibilityElements,
                        GroupingAndOrder.groupViews,
                        GroupingAndOrder.shouldGroupAccessibilityChildren,
                        GroupingAndOrder.accessibilityNavigationStyle]),

    SectionGroup(section: .accessibilityAction,
                 items: [AccessibilityAction.accessibilityActivate,
                        AccessibilityAction.accessibilityCustomAction,
                        AccessibilityAction.accessibilityScroll,
                        AccessibilityAction.accessibilityDecrementAndIncrement,
                        AccessibilityAction.accessibilityPerformEscape,
                        AccessibilityAction.accessibilityPerformMagicTap]),

    SectionGroup(section: .notifications,
                 items: [Notifications.screenChanged,
                        Notifications.layoutChanged,
                        Notifications.pageScrolled,
                        Notifications.announcement,
                        Notifications.announcementDidFinish]),

    SectionGroup(section: .dynamicType,
                 items: [DynamicType.dynamicLabels,
                        DynamicType.dynamicImages,
                        DynamicType.largeContentViewer])
]
