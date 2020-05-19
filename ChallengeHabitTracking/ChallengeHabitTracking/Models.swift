//
//  Models.swift
//  ChallengeHabitTracking
//
//  Created by Munir Wanis | Stone on 01/04/20.
//  Copyright © 2020 Wanis Co. All rights reserved.
//

import Foundation

struct ActivityCount: Codable {
    let id: UUID
    var count: Int
}

struct Activity: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.id = UUID()
        self.title = title
        self.description = description
    }
}

class Activities: ObservableObject {
    @Published var items = [Activity]()
}
