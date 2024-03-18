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
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
                    Spacer(minLength: 0)
                    
                    Text("Sent the code to \(app.currentUser!.email.rawValue)")
                        .font(.title2())
                        .foregroundStyle(.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                    
                    Text("Write it to confirm that it is you and not someone else logging into your personal account")
                        .font(.title3())
                        .foregroundStyle(.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                    
                    VerificationCodeBox(code: $enteredCode, numberOfCharacters: numberOfCharacters, charactersFilter: { $0.isNumber })
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .autocorrectionDisabled()
                    
                    RoundedButton(text: "Confirm") {
                        app.endUserAuthentication(with: enteredCode)
                        print(enteredCode)
                        coordinator.changeTab(to: .search)
                    }
                    .disabled(enteredCode.count<numberOfCharacters)
                    Text(enteredCode)
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
    @State var coordinator = Coordinator()
    @State var app = WorkAppSwiftUI()
    coordinator.push(.loginCode)
    app.startUserAuthentication(with: EmailAddress(rawValue: "alex.vasilevski007@gmail.com")!)
    return LoginCodeView()
        .environmentObject(coordinator)
        .environmentObject(app)
}
