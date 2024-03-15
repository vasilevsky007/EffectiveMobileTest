//
//  WorkAppSwiftUI.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

@MainActor class WorkAppSwiftUI: ObservableObject {
    @Published var currentUser: User?
    
    var isAuthenticated: Bool {
        guard let currentUser = currentUser else { return false }
        return currentUser.isAuthenticated
    }
    
    func startUserAuthentication(with email: EmailAddress) {
        currentUser = User(email: email)
    }
    
    func endUserAuthentication(with code: String) {
        currentUser?.saveToken(code)
    }
}
