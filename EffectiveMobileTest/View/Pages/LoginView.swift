//
//  LoginView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

/// A view for the login screen.
///
/// `LoginView` displays a screen for users to log in to their accounts.
///
/// Use this view to present a login interface for both employees and employers.
struct LoginView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
                    Text("Log in to your personal account")
                        .font(.title2())
                        .foregroundStyle(.white)
                    Spacer(minLength: 0)
                    EmployeeLoginForm()
                    EmployerLoginForm()
                    Spacer(minLength: 0)
                }.frame(minHeight: geometry.size.height)
            }
                .scrollDismissesKeyboard(.immediately)
                .scrollIndicators(.never)
                .scrollBounceBehavior(.basedOnSize, axes: .vertical)
        }
    }
}

#Preview {
    LoginView()
}
