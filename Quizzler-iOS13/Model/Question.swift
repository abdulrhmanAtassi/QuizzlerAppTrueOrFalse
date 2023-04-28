//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Abdulrhman on 05/03/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let name : String
    let answer : String
    init(q: String, a: String) {
        self.name = q
        self.answer = a
    }
}
