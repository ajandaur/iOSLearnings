//
//  Item.swift
//  StewartLynch-Realm-1
//
//  Created by Anmol  Jandaur on 2/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
