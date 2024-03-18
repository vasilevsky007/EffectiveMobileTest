//
//  NumberSticker.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

struct NumberSticker: ViewModifier {
    let number: Int
    
    func body(content: Content) -> some View {
        if number > 0 {
            content.overlay(alignment: .topTrailing) {
                Text(
                    number < 999 ?
                    number.formatted() :
                        "999+"
                )
                .lineLimit(1)
                .font(.number())
                .foregroundStyle(.white)
                .padding(.horizontal, DrawingConstants.halfSpacing)
                .frame(minWidth: 13, minHeight: 13)
                .background(.red, in: Capsule())
                .offset(
                    x: DrawingConstants.halfSpacing,
                    y: -(DrawingConstants.halfSpacing)
                )
            }
        } else {
            content
        }
    }
}

extension View {
    func numberSticker(number: Int) -> some View {
        self.modifier(NumberSticker(number: number))
    }
}

#Preview {
    Text("").numberSticker(number: 99999)
}
