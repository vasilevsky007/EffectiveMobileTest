//
//  StrokeText.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

struct StrokeTextModifier: ViewModifier {
    let width: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        ZStack{
            ZStack{
                content.offset(x:  width, y:  width)
                content.offset(x: -width, y: -width)
                content.offset(x: -width, y:  width)
                content.offset(x:  width, y: -width)
                content.offset(x:  0, y:  width)
                content.offset(x: 0, y: -width)
                content.offset(x: -width, y: 0)
                content.offset(x:  width, y: 0)
            }
            .foregroundStyle(color)
            content
        }
    }
}

extension Text {
    func strokeText(width: CGFloat, color: Color) -> some View {
        self.modifier(StrokeTextModifier(width: width, color: color))
    }
}
