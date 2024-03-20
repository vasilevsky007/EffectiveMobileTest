//
//  SwitchButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import SwiftUI

/// A switch button view.
///
/// `SwitchButton` displays an image that represents a binary state and allows toggling between two states.
///
/// Use ``init(state:imageTrue:imageFalse:action:)`` to create a switch button with custom images for each state and an action to perform when tapped.
struct SwitchButton: View {
    private let state: Bool
    
    private let imageTrue: ImageResource
    private let imageFalse: ImageResource
    
    private let action: () -> Void
    
    /// Initializes a new instance of ``SwitchButton``.
    /// - Parameters:
    ///   - state: The current state of the switch button.
    ///   - imageTrue: The image resource to display when the state is true.
    ///   - imageFalse: The image resource to display when the state is false.
    ///   - action: The closure to execute when the button is tapped.
    init(state: Bool, imageTrue: ImageResource, imageFalse: ImageResource, action: @escaping () -> Void) {
        self.state = state
        self.imageTrue = imageTrue
        self.imageFalse = imageFalse
        self.action = action
    }
    
    var body: some View {
        Button {
           action()
        } label: {
            Image(state ? imageTrue : imageFalse)
                .resizable()
                .frame(
                    width: DrawingConstants.SwitchButton.imageSize,
                    height: DrawingConstants.SwitchButton.imageSize
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SwitchButton(
        state: true,
        imageTrue: .init(name: "favouritesFilled", bundle: .main),
        imageFalse: .init(name: "favourites", bundle: .main),
        action: {}
    )
}
