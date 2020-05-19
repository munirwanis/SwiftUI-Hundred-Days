//
//  ContentView.swift
//  OhMyCelsius
//
//  Created by Munir Wanis on 2020-02-22.
//  Copyright © 2020 Munir Wanis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var convertToSelectedTemperature = 0
    
    let temperatures = ["Fahrenheit", "Kelvin"]
    
    var temperatureCode: String {
        String(temperatures[convertToSelectedTemperature].first!)
    }
    
    var convertedTemperature: Double {
        let currentTemperature = Double(amount) ?? 0
        
        if convertToSelectedTemperature == 0 {
            return currentTemperature * 1.8 + 32
        } else {
            return currentTemperature + 273.15
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Current temperature in Celsius",
                        text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select the conversion")) {
                    Picker("Current temperature",
                           selection: $convertToSelectedTemperature) {
                        ForEach(0 ..< temperatures.count) {
                            Text("\(self.temperatures[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("The temperature is")) {
                    Text("\(convertedTemperature, specifier: "%.2f")º \(temperatureCode)")
                }
            }
            .navigationBarTitle("Oh My Celsius")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
