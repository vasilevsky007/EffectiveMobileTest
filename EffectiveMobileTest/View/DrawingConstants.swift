//
//  DrawingConstants.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import Foundation

struct DrawingConstants {
    static let cornerRadius: CGFloat = 8
    static let blockCornerRadius: CGFloat = 8
    static let standardSpacing: CGFloat = 8
    static let halfSpacing: CGFloat = 4
    static let doubleSpacing: CGFloat = 16
    static let tripleSpacing: CGFloat = 24
    static let lineElementHeight: CGFloat = 40
    
    struct MenuBar {
        static let height: CGFloat = 40
        static let imageSize: CGFloat = 24
    }
    
    struct NavigationBar {
        static let buttonsHeight: CGFloat = 28
        static let backButtonHeight: CGFloat = tripleSpacing
    }
    
    struct PrettyTextField {
        static let imageSize: CGFloat = 24
        static let closeImageSize: CGFloat = 14
        static let closeImagePadding: CGFloat = 5
    }
    
    struct PillowButton {
        static let height: CGFloat = 32
    }
    
    struct VerificationCodeBox {
        static let size: CGFloat = 48
    }
    
    struct VacancyBlock {
        static let spacing: CGFloat = 10
        static let textImageSize: CGFloat = 16
    }
    
    struct SwitchButton {
        static let imageSize: CGFloat = 24
    }
    
    struct OfferBlock {
        static let height: CGFloat = 120
        static let width: CGFloat = 132
        static let imageSize: CGFloat = 24
        static let imageInnerPadding: CGFloat = 4
    }
    
    struct SmallRoundedButton {
        static let size: CGFloat = 40
        static let imageSize: CGFloat = 24
    }
    
    struct LiveInfoBlock {
        static let height: CGFloat = 50
    }
    
    struct VacancyDetailsView {
        static let mapHeight: CGFloat = 58
        static let mapBlockVerticalPadding = standardSpacing * 1.5
        static let questionHorizontalPadding = standardSpacing * 1.5
    }
}
