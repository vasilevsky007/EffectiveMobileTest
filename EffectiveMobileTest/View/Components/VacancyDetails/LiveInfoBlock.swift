//
//  LiveInfoBlock.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import SwiftUI

/// A block displaying live information.
///
/// `LiveInfoBlock` presents live information about vacancy with text and an associated image.
///
/// Use ``init(text:image:)`` to create a block for displaying live information.
struct LiveInfoBlock: View {
    private let text: LocalizedStringKey
    private let image: ImageResource
    
    /// Initializes a new instance of ``LiveInfoBlock``.
    /// - Parameters:
    ///   - text: The text to display.
    ///   - image: The image associated with the live information.
    init(text: LocalizedStringKey, image: ImageResource) {
        self.text = text
        self.image = image
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text(text)
                .font(.text1())
                .foregroundStyle(.white)
            
            Spacer(minLength: DrawingConstants.standardSpacing)
            
            Image(image)
                .resizable()
                .foregroundStyle(.white)
                .frame(
                    width: DrawingConstants.standardSpacing,
                    height: DrawingConstants.standardSpacing
                )
                .frame(
                    width: DrawingConstants.doubleSpacing,
                    height: DrawingConstants.doubleSpacing,
                    alignment: .center
                )
                .background(.salad, in: .circle)
        }
        .padding(DrawingConstants.standardSpacing)
        .frame(minHeight: DrawingConstants.LiveInfoBlock.height, alignment: .top)
        .background(.saladDisabled, in: .rect(cornerRadius: DrawingConstants.cornerRadius))
    }
}

#Preview {
    LiveInfoBlock(text: "", image: .init(name: "profile", bundle: .main))
        .frame(width: 160)
}
