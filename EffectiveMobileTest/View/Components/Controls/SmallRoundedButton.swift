//
//  SmallRoundedButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

struct SmallRoundedButton: View {
    var imageName: String
    var action: () -> Void
    
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
