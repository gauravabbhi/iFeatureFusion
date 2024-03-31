//
//  Item.swift
//  iFeatureFusionLite
//
//  Created by Karan on 30/03/24.
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
