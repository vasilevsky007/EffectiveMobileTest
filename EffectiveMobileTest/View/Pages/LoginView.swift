//
//  LoginView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
            Text(Coordinator.Page.login.name)
                .font(.title2())
                .strokeText(width: 1, color: .black)
                .foregroundStyle(.white)
//                .containerRelativeFrame(.horizontal, alignment: .leading)
            Spacer(minLength: 0)
            EmployeeLoginForm()
            EmployerLoginForm()
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    LoginView()
}
