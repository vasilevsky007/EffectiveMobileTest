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
        Button(text) {
            action()
        }
            .foregroundStyle(.white)
            .buttonStyle(.plain)
            .frame(height: DrawingConstants.lineElementHeight)
            .frame(maxWidth: .infinity)
            .background(
                isEnabled ?
                    Color.accentColor :
                    Color.accentDisabled,
                in: RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            )
            .foregroundColor(.primary)
    }
}

#Preview {
    RoundedButton(text: "", action: {})
        .disabled(true)
}
