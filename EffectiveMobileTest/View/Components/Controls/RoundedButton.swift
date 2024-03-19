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
    
    var height = DrawingConstants.lineElementHeight
    var color = Color.accentColor
    var disabledColor = Color.accentDisabled
    
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
        .frame(height: height)
        .background(
            isEnabled ? color : disabledColor,
            in: RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        )
    }
}

#Preview {
    RoundedButton(text: "", action: { print("hello") })
//        .disabled(true)
}
