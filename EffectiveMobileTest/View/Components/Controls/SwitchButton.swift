//
//  SwitchButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import SwiftUI

struct SwitchButton: View {
    var state: Bool
    
    var imageTrue: ImageResource
    var imageFalse: ImageResource
    
    var action: () -> Void
    
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
