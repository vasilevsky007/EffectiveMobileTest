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
    
    @State var email = "alex.vasilevski007@gmail.com"
    @State var error: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
            Text("Поиск работы")
                .font(.title3())
                .strokeText(width: 1, color: .black)
                .foregroundStyle(.white)
            
            
            PrettyTextField(text: $email, placehoderText: "Электронная почта или телефон", placeholderImage: "responses", errorMessage: error)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .submitLabel(.continue)
                .onSubmit(submitAction)
            
            HStack {
                RoundedButton(text: "Продолжить") {
                    submitAction()
                }
                .disabled(isEmailEmpty)
                .animation(.easeInOut, value: isEmailEmpty)
                
                Button("Войти с паролем") { }
                .padding(.leading, DrawingConstants.tripleSpacing)
                .font(.buttonText2())
            }
        }
        .padding(.horizontal, DrawingConstants.doubleSpacing)
        .padding(.vertical, DrawingConstants.tripleSpacing)
        .background(Color.blockBackground, in: RoundedRectangle(cornerRadius: 10))
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
                error = "Вы ввели неверный e-mail"
            }
        }
    }
}

#Preview {
    EmployeeLoginForm()
}
