//
//  DrawingConstants.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import Foundation

struct DrawingConstants {
    static let cornerRadius: CGFloat = 8
    static let standardSpacing: CGFloat = 8
    static let doubleSpacing: CGFloat = 16
    static let tripleSpacing: CGFloat = 24
    static let lineElementHeight: CGFloat = 40
    
    struct MenuBar {
        static let height: CGFloat = 40
        static let imageSize: CGFloat = 24
    }
    
    struct PrettyTextField {
        static let imageSize: CGFloat = 24
        static let closeImageSize: CGFloat = 14
        static let closeImagePadding: CGFloat = 5
        static let shadowRadius: CGFloat = 4
        static let shadowOffsetX: CGFloat = 0
        static let shadowOffsetY: CGFloat = 4
    }
    
    struct PillowButton {
        static let height: CGFloat = 32
    }
    
    struct VerificationCodeBox {
        static let size: CGFloat = 48
    }
}
