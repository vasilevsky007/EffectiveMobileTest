//
//  EmailAddress.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import Foundation

/// A structure representing an email address.
///
/// Used primarly for entered email validation
struct EmailAddress: RawRepresentable, Codable {
    /// The raw value of the email address as a `String`.
    let rawValue: String
    
    /// Initializes an email address with the specified raw value.
    /// - Parameter rawValue: The raw value to be used for initialization.
    /// - Returns: An initialized email address, or nil if the raw value does not represent a valid email address.
    init?(rawValue: String) {
        let detector = try? NSDataDetector(
            types: NSTextCheckingResult.CheckingType.link.rawValue
        )
        let range = NSRange(
            rawValue.startIndex..<rawValue.endIndex,
            in: rawValue
        )
        let matches = detector?.matches(
            in: rawValue,
            options: [],
            range: range
        )
        guard let match = matches?.first, matches?.count == 1 else {
            return nil
        }
        guard match.url?.scheme == "mailto", match.range == range else {
            return nil
        }
        self.rawValue = rawValue
    }
}
