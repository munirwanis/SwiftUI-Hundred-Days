//
//  Models.swift
//  iExpense
//
//  Created by Munir Wanis on 2020-03-16.
//  Copyright © 2020 Munir Wanis. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let enconder = JSONEncoder()
            
            if let encoded = try? enconder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from: data) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}
