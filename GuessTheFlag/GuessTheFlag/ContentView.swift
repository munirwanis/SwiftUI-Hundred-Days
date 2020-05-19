//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Munir Wanis on 2020-02-22.
//  Copyright © 2020 Munir Wanis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US"
        ].shuffled()
    @State var correctAnwser = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var opacity = 1.0
    @State private var animationAmount = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnwser])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .accessibilityElement(children: .ignore)
                .accessibility(label: Text("Tap the flag of \(countries[correctAnwser])"))
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        if number == self.correctAnwser {
                            withAnimation {
                                self.animationAmount += 360
                            }
                        }
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                            .opacity((self.showingScore && self.correctAnwser != number) ? 0.50 : 1.0)
                            .animation(.default)
                            .accessibility(label: Text(self.labels[self.countries[number], default: "Unknown flag"]))
                    }
                    .allowsHitTesting(!self.showingScore) // disables touch
                    .rotation3DEffect(number == self.correctAnwser ? .degrees(self.animationAmount) : .zero, axis: (x: 0, y: 1, z: 0))
                }
                
                Spacer()
                
                if showingScore {
                    VStack(spacing: 20) {
                        Text(scoreTitle)
                            .font(.body)
                            .foregroundColor(.white)
                        Text("Your score is \(self.score)")
                            .font(.title)
                            .foregroundColor(.white)
                        Button("Continue") {
                            self.askQuestion()
                            withAnimation {
                                self.showingScore = false
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .animation(.default)
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnwser {
            score += 10
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnwser = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
