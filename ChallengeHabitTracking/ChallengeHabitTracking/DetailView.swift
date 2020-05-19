//
//  DetailView.swift
//  ChallengeHabitTracking
//
//  Created by Munir Wanis | Stone on 01/04/20.
//  Copyright © 2020 Wanis Co. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let activity: Activity
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text(activity.description)
                .padding()
            
            Stepper("You completed this activity \(count) times", value: $count, in: 0...100, step: 1)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(activity.title), displayMode: .inline)
        .onAppear {
            func search(_ activityCount: ActivityCount) -> Bool {
                activityCount.id == self.activity.id
            }
            
            if let item = self.activitiesCount().first(where: search) {
                self.count = item.count
            }
        }
        .onDisappear {
            var items = self.activitiesCount()
            let item = ActivityCount(id: self.activity.id, count: self.count)
            if let index = self.index(for: self.activity.id, in: items) {
                items[index] = item
            } else {
                items.append(item)
            }
            UserDefaults.standard.set(item: items, forKey: .activityCount)
        }
    }
    
    private func activitiesCount() -> [ActivityCount] {
        UserDefaults.standard.get(forKey: .activityCount) ?? []
    }
    
    private func index(for id: UUID, in array: [ActivityCount]) -> Int? {
        guard let index = array.firstIndex(where: { $0.id == id }) else {
            return nil
        }
        
        return index
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: .init(title: "", description: ""))
    }
}
