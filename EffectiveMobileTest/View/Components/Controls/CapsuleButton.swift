//
//  PillowButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

struct CapsuleButton: View {
    @Environment(\.isEnabled) private var isEnabled
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(text) {
            action()
        }
        .foregroundStyle(.white)
        .buttonStyle(.plain)
        .frame(height: DrawingConstants.PillowButton.height)
        .frame(maxWidth: .infinity)
        .background(
            isEnabled ?
            Color.salad :
                Color.saladDisabled,
            in: .capsule
        )
        .foregroundColor(.primary)
    }
}

#Preview {
    CapsuleButton(text: "djshknl", action: {}).disabled(true)
}
