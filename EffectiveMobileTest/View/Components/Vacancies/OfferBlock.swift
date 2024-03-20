//
//  OfferBlock.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

/// A block representing an offer.
///
/// `OfferBlock` displays an offer with an image, title, and an optional button.
///
/// Use ``init(imageName:imageBackground:title:buttonTitle:)`` to create a block for displaying an offer.
struct OfferBlock: View {
    private let imageName: String
    private let imageBackground: Color
    private let title: LocalizedStringKey
    private let buttonTitle: LocalizedStringKey?
    
    /// Initializes a new instance of ``OfferBlock``.
    /// - Parameters:
    ///   - imageName: The name of the image to display.
    ///   - imageBackground: The background color of the image.
    ///   - title: The title of the offer.
    ///   - buttonTitle: The title of the optional button.
    init(imageName: String, 
         imageBackground: Color = .accentDisabled,
         title: LocalizedStringKey,
         buttonTitle: LocalizedStringKey? = nil) {
        self.imageName = imageName
        self.imageBackground = imageBackground
        self.title = title
        self.buttonTitle = buttonTitle
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(imageName)
                .resizable()
                .frame(
                    width: DrawingConstants.OfferBlock.imageSize,
                    height: DrawingConstants.OfferBlock.imageSize
                )
                .padding(DrawingConstants.OfferBlock.imageInnerPadding)
                .background(imageBackground, in: .circle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, DrawingConstants.doubleSpacing)
            Text(title)
                .font(.title4())
                .foregroundStyle(.white)
                .tracking(-0.1)
            if let buttonTitle = buttonTitle {
                Text(buttonTitle)
                    .font(.title4())
                    .foregroundStyle(.salad)
            }
            Spacer(minLength: 0)
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .frame(
            width: DrawingConstants.OfferBlock.width,
            height: DrawingConstants.OfferBlock.height
        )
        .background(Color.blockBackground, in: RoundedRectangle(cornerRadius: DrawingConstants.blockCornerRadius))
    }
}

#Preview {
    OfferBlock(imageName: "star", imageBackground: .saladDisabled, title: "Boost your resume in the search", buttonTitle: "Boost")
}
