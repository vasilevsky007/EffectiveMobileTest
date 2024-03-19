//
//  EmployerLoginForm.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

struct EmployerLoginForm: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
            Text("Employee Search")
                .font(.title3())
                .foregroundStyle(.white)
            
            Text("Posting of vacancies and access to the CV database")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .font(.text1())
                .foregroundStyle(.white)
            
            CapsuleButton(text: "I'm looking for employees") {  }
        }
        .padding(.horizontal, DrawingConstants.doubleSpacing)
        .padding(.vertical, DrawingConstants.tripleSpacing)
        .background(Color.blockBackground, in: RoundedRectangle(cornerRadius: DrawingConstants.blockCornerRadius))
    }
}

#Preview {
    EmployerLoginForm()
}
