//
//  EmployerLoginForm.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

/// A form for employer login.
///
/// `EmployerLoginForm` provides a form interface for employers to log in to the application. It includes options for posting vacancies and accessing the CV database.
///
/// Use ``init()`` to create a login form for employers.
struct EmployerLoginForm: View {
    /// Initializes a new instance of ``EmployerLoginForm``.
    init() {}
    
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
