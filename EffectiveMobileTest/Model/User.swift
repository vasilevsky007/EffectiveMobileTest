//
//  User.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import Foundation

struct User: Identifiable {
    
    var id: String {
        email.rawValue
    }
    
    private(set) var email: EmailAddress
    private(set) var token: String?
    
    var isAuthenticated: Bool {
        token != nil
    }
    
    init(email: EmailAddress) {
        self.email = email
    }
    
    mutating func saveToken(_ token: String) {
        self.token = token
    }
}
