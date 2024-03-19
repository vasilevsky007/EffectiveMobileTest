//
//  String.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import Foundation

extension String {
    var firstLetterCapitalized: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
    
    static func enumeration (of array: [String]) -> String {
        var resultString = ""
        if let first = array.first {
            resultString.append(first.firstLetterCapitalized)
        }
        for string in array.dropFirst() {
            resultString.append(", " + string)
        }
        return resultString
    }
}
