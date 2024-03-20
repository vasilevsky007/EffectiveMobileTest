//
//  DrawingConstants.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import Foundation

/// struct namespacing all constants for view presenation. Contain nested structs for View-specific constants.
struct DrawingConstants {
    static let standardSpacing: CGFloat = 8
    static let cornerRadius: CGFloat = standardSpacing
    static let halfSpacing: CGFloat = standardSpacing / 2.0
    static let doubleSpacing: CGFloat = standardSpacing * 2.0
    static let tripleSpacing: CGFloat = standardSpacing * 3.0
    static let lineElementHeight: CGFloat = standardSpacing * 5.0
    
    struct MenuBar {
        static let height: CGFloat = standardSpacing * 5.0
        static let imageSize: CGFloat = tripleSpacing
    }
    
    struct NavigationBar {
        static let buttonsHeight: CGFloat = standardSpacing * 3.5
        static let backButtonHeight: CGFloat = tripleSpacing
    }
    
    struct PrettyTextField {
        static let imageSize: CGFloat = tripleSpacing
        static let closeImageSize: CGFloat = 14
        static let closeImagePadding: CGFloat = 5
    }
    
    struct PillowButton {
        static let height: CGFloat = standardSpacing * 4.0
    }
    
    struct VerificationCodeBox {
        static let size: CGFloat = standardSpacing * 6.0
    }
    
    struct VacancyBlock {
        static let spacing: CGFloat = standardSpacing * 1.25
        static let textImageSize: CGFloat = doubleSpacing
    }
    
    struct SwitchButton {
        static let imageSize: CGFloat = tripleSpacing
    }
    
    struct OfferBlock {
        static let height: CGFloat = standardSpacing * 15.0
        static let width: CGFloat = standardSpacing * 16.5
        static let imageSize: CGFloat = tripleSpacing
        static let imageInnerPadding: CGFloat = halfSpacing
    }
    
    struct SmallRoundedButton {
        static let size: CGFloat = standardSpacing * 5.0
        static let imageSize: CGFloat = tripleSpacing
    }
    
    struct LiveInfoBlock {
        static let height: CGFloat = standardSpacing * 6.25
    }
    
    struct VacancyDetailsView {
        static let mapHeight: CGFloat = standardSpacing * 7.25
        static let mapBlockVerticalPadding = standardSpacing * 1.5
        static let questionHorizontalPadding = standardSpacing * 1.5
    }
}
