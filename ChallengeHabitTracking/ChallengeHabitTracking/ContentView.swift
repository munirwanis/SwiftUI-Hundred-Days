//
//  ContentView.swift
//  ChallengeHabitTracking
//
//  Created by Munir Wanis | Stone on 01/04/20.
//  Copyright © 2020 Wanis Co. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(destination: DetailView(activity: item)) {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            
                            Text(item.description)
                                .padding(.top)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habit Tracking")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddActivity) {
            AddView(activities: self.activities)
        }
    }
    
    private func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
        UserDefaults.standard.set(item: activities.items, forKey: .activities)
    }
    
    init() {
        self.activities.items = UserDefaults.standard.get(forKey: .activities) ?? []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
