//
//  SmallRoundedButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

/// A small rounded button view with an image.
///
/// `SmallRoundedButton` displays an image within a small rounded button area. It is commonly used for presenting actions or options in a compact format.
///
/// Use ``init(imageName:action:)`` to create a small rounded button with a specific image and action.
struct SmallRoundedButton: View {
    private let imageName: String
    private let action: () -> Void
    
    /// Initializes a new instance of ``SmallRoundedButton``.
    /// - Parameters:
    ///   - imageName: The name of the image to display on the button.
    ///   - action: The closure to execute when the button is tapped.
    init(imageName: String, action: @escaping () -> Void) {
        self.imageName = imageName
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .frame(
                    width: DrawingConstants.SmallRoundedButton.imageSize,
                    height: DrawingConstants.SmallRoundedButton.imageSize
                )
                .padding(DrawingConstants.standardSpacing)
                .background(.controlBackground, in: .rect(cornerRadius: DrawingConstants.cornerRadius))
        }

        
    }
}

#Preview {
    SmallRoundedButton(imageName: "filter") {}
}
