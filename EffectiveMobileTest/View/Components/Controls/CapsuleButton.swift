//
//  PillowButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

/// A customizable capsule button view.
///
/// Use ``init(text:action:)`` to create a capsule-shaped button with customizable appearance.
struct CapsuleButton: View {
    @Environment(\.isEnabled) private var isEnabled
    private let text: LocalizedStringKey
    private let action: () -> Void
    
    /// Initializes a new instance of ``CapsuleButton``.
    /// - Parameters:
    ///   - text: The localized text displayed on the button.
    ///   - action: The closure to execute when the button is tapped.
    init(text: LocalizedStringKey, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
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
