//
//  User.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import Foundation

/// A structure representing a user. Used primarly to handle the authentacation state
struct User: Identifiable {
    /// The email address associated with the user.
    private(set) var email: EmailAddress
    /// The authentication token used to authenticate the user.
    private(set) var token: String?
    
    /// A Boolean value indicating whether the user is authenticated.
    var isAuthenticated: Bool {
        token != nil
    }
    
    /// The unique identifier for the user, derived from the email address.
    var id: String {
        email.rawValue
    }
    
    /// Initializes a user with the specified email address.
    /// - Parameter email: The email address to be associated with the user.
    init(email: EmailAddress) {
        self.email = email
    }
    
    /// Saves the authentication token for the user.
    /// - Parameter token: The authentication token to be saved.
    mutating func saveToken(_ token: String) {
        self.token = token
    }
}
