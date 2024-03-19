//
//  LiveInfoBlock.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import SwiftUI

struct LiveInfoBlock: View {
    var text: LocalizedStringKey
    var image: ImageResource
    
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
