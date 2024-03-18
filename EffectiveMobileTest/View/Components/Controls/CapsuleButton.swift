//
//  PillowButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

struct CapsuleButton: View {
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
        .frame(height: DrawingConstants.PillowButton.height)
        .background(
            isEnabled ?
            Color.salad :
                Color.saladDisabled,
            in: .capsule
        )
    }
}

#Preview {
    CapsuleButton(text: "", action: { print("hello") })//.disabled(true)
}
