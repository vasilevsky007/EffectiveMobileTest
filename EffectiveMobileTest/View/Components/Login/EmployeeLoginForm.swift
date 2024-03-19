//
//
//  EmployeeLoginForm.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

struct EmployeeLoginForm: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    @State var email = ""
    @State var error: LocalizedStringKey?
    
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
            Text("Finding a job")
                .font(.title3())
                .foregroundStyle(.white)
            
            
            PrettyTextField(text: $email, placehoderText: "Email or phone", placeholderImage: "responses", errorMessage: error)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .submitLabel(.continue)
                .onSubmit(submitAction)
            
            HStack {
                RoundedButton(text: "Continue") {
                    submitAction()
                }
                .disabled(isEmailEmpty)
                .animation(.easeInOut, value: isEmailEmpty)
                
                Button("Log in with password") { }
                .padding(.leading, DrawingConstants.tripleSpacing)
                .font(.buttonText2())
            }
        }
        .padding(.horizontal, DrawingConstants.doubleSpacing)
        .padding(.vertical, DrawingConstants.tripleSpacing)
        .background(Color.blockBackground, in: RoundedRectangle(cornerRadius: DrawingConstants.blockCornerRadius))
        .onChange(of: email) {
            withAnimation {
                error = nil
            }
        }
    }
    
    private var isEmailEmpty: Bool {
        email == ""
    }
    
    private func submitAction() {
        if let email = EmailAddress(rawValue: email) {
            withAnimation {
                app.startUserAuthentication(with: email)
                coordinator.push(.loginCode)
            }
        } else {
            withAnimation {
                error = "You've entered an incorrect e-mail"
            }
        }
    }
}

#Preview {
    EmployeeLoginForm()
}
