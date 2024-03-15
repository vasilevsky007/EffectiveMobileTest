//
//  LoginCodeView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

struct LoginCodeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    @State private var enteredCode = ""
    
    private let numberOfCharacters = 4
    
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
            Spacer(minLength: 0)
            
            Text("Отправили код на \(app.currentUser!.email.rawValue)")
                .font(.title2())
                .foregroundStyle(.white)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
            
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.title3())
                .foregroundStyle(.white)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
            
            VerificationCodeBox(code: $enteredCode, numberOfCharacters: numberOfCharacters, charactersFilter: { $0.isNumber })
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .autocorrectionDisabled()
            
            RoundedButton(text: "Подтвердить") {
                app.endUserAuthentication(with: enteredCode)
                print(enteredCode)
                coordinator.changeTab(to: .search)
            }
            .disabled(enteredCode.count<numberOfCharacters)
            Text(enteredCode)
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    @State var coordinator = Coordinator()
    @State var app = WorkAppSwiftUI()
    coordinator.push(.loginCode)
    app.startUserAuthentication(with: EmailAddress(rawValue: "alex.vasilevski007@gmail.com")!)
    return LoginCodeView()
        .environmentObject(coordinator)
        .environmentObject(app)
}
