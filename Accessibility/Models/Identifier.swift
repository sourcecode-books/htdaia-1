//
//  Identifier.swift
//  Accessibility
//
//  Created by Jeroen de Vrind on 09/05/2020.
//  Copyright © 2020 Jeroen de Vrind. All rights reserved.
//

import Foundation

enum TableViewCell: String {
    case defaultCell = "defaultCell"
    case dynamicTypeCell = "DynamicTypeCell"

    var identifier: String {
            return self.rawValue
    }
}

enum Nib: String {
    case dynamicTableViewCell = "DynamicTableViewCell"

    var name: String {
        return self.rawValue
    }
}
