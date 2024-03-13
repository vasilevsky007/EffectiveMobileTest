//
//  Fonts.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

extension Font {
    static func title1 () -> Font {
        .system(size: 22, weight: .semibold)
    }
    static func title2 () -> Font {
        .system(size: 20, weight: .semibold)
    }
    static func title3 () -> Font {
        .system(size: 16, weight: .medium)
    }
    static func title4 () -> Font {
        .system(size: 14, weight: .medium)
    }
    static func text1 () -> Font {
        .system(size: 14, weight: .regular)
    }
    static func buttonText1 () -> Font {
        .system(size: 16, weight: .semibold)
    }
    static func buttonText2 () -> Font {
        .system(size: 14, weight: .regular)
    }
    static func tabText () -> Font {
        .system(size: 10, weight: .regular)
    }
    static func number () -> Font {
        .system(size: 7, weight: .regular)
    }
}
