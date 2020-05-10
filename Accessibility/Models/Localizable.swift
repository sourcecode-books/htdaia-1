//
//  Localizable.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 09/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import Foundation

struct Localizable {

    static func string(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
