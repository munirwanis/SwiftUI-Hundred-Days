//
//  Card.swift
//  Flashzilla
//
//  Created by Munir Wanis | Stone on 03/05/20.
//  Copyright © 2020 Wanis Co. All rights reserved.
//

import Foundation

struct Card: Codable {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
