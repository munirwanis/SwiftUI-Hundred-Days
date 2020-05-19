//
//  AddView.swift
//  ChallengeHabitTracking
//
//  Created by Munir Wanis | Stone on 01/04/20.
//  Copyright © 2020 Wanis Co. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                guard !self.title.isEmpty, !self.description.isEmpty else {
                    return
                }
                
                let item = Activity(title: self.title,
                                    description: self.description)
                self.activities.items.append(item)
                UserDefaults.standard.set(item: self.activities.items, forKey: .activities)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: .init())
    }
}
