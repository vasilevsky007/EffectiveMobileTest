//
//  RoundedButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 14.03.24.
//

import SwiftUI

/// A customizable rounded button view.
///
/// Use ``init(text:height:color:disabledColor:action:)`` to create a button with rounded corners and customizable appearance.
struct RoundedButton: View {
    @Environment(\.isEnabled) private var isEnabled
    
    private let text: LocalizedStringKey
    
    private let height: CGFloat
    private let color: Color
    private let disabledColor: Color
    
    private let action: () -> Void
    
    /// Initializes a new instance of ``RoundedButton``.
    /// - Parameters:
    ///   - text: The localized text displayed on the button.
    ///   - height: The height of the button.
    ///   - color: The color of the button when enabled.
    ///   - disabledColor: The color of the button when disabled.
    ///   - action: The closure to execute when the button is tapped.
    init(text: LocalizedStringKey,
         height: CGFloat = DrawingConstants.lineElementHeight,
         color: Color = .accentColor,
         disabledColor: Color = .accentDisabled,
         action: @escaping () -> Void) {
        self.text = text
        self.height = height
        self.color = color
        self.disabledColor = disabledColor
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
