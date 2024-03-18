//
//  LoginView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
                    Text("Log in to your personal account")
                        .font(.title2())
                        .strokeText(width: 1, color: .black)
                        .foregroundStyle(.white)
                    //                .containerRelativeFrame(.horizontal, alignment: .leading)
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
