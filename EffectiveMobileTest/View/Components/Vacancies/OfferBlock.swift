//
//  OfferBlock.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

struct OfferBlock: View {
    var imageName: String
    var imageBackground: Color = .accentDisabled
    var title: String
    var buttonTitle: String?
    
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
    OfferBlock(imageName: "star", imageBackground: .saladDisabled, title: "Поднять резюме в поиске", buttonTitle: "Поднять")
}
