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
            Text("Поиск работы")
                .font(.title3())
                .strokeText(width: 1, color: .black)
                .foregroundStyle(.white)
            
            Text("Размещение вакансий и доступ к базе резюме")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .font(.text1())
                .foregroundStyle(.white)
            
            CapsuleButton(text: "Я ищу сотрудников") {  }
        }
        .padding(.horizontal, DrawingConstants.doubleSpacing)
        .padding(.vertical, DrawingConstants.tripleSpacing)
        .background(Color.blockBackground, in: RoundedRectangle(cornerRadius: DrawingConstants.blockCornerRadius))
    }
}

#Preview {
    EmployerLoginForm()
}
