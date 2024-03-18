//
//  RoundedButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

struct RoundedButton: View {
    @Environment(\.isEnabled) private var isEnabled
    
    var text: LocalizedStringKey
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer(minLength: 0)
                Text(text)
                    .foregroundStyle(.white)
                Spacer(minLength: 0)
            }
        }
        .frame(height: DrawingConstants.lineElementHeight)
        .background(
            isEnabled ?
            Color.accentColor :
                Color.accentDisabled,
            in: RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        )
    }
}

#Preview {
    RoundedButton(text: "", action: { print("hello") })
//        .disabled(true)
}
