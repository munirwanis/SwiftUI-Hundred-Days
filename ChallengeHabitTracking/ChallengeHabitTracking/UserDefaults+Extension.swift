//
//  UserDefaults+Extension.swift
//  ChallengeHabitTracking
//
//  Created by Munir Wanis | Stone on 01/04/20.
//  Copyright © 2020 Wanis Co. All rights reserved.
//

import Foundation

extension UserDefaults {
    func get<T: Decodable>(forKey key: String) -> T? {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        return try? decoder.decode(T.self, from: data)
    }
    
    func set<T: Encodable>(item object: T, forKey key: String) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(object)
        UserDefaults.standard.set(data, forKey: key)
    }
}

// MARK: - Key extension

extension String {
    static let activities = "kActivitiesPlus"
    static let activityCount = "kActivityCount"
}
