//
//  String.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import Foundation

extension String {
    /// Returns a new string with only the first letter capitalized.
    var firstLetterCapitalized: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
    
    /// Returns a string representing the enumeration of the provided array of strings.
    /// - Parameter array: An array of strings to be enumerated.
    /// - Returns: A string representing the enumeration of the provided array of strings.
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
