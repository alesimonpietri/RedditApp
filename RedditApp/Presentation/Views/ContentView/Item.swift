//
//  Item.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
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
