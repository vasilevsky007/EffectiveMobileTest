//
//  NavigationBar.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import SwiftUI

/// A navigation bar view.
///
/// `NavigationBar` provides a customizable navigation bar layout with additional buttons.
///
/// Use ``init(additionalButtons:)`` to create a navigation bar with custom additional buttons.
struct NavigationBar<Content>: View where Content: View{
    @EnvironmentObject private var coordinator: Coordinator
    
    @ViewBuilder private let additionalButtons: () -> Content
    
    /// Initializes a new instance of ``NavigationBar``.
    /// - Parameter additionalButtons: A closure providing the content for additional buttons in the navigation bar.
    init(@ViewBuilder additionalButtons: @escaping () -> Content) {
        self.additionalButtons = additionalButtons
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                coordinator.pop()
            } label: {
                Image(.back)
                    .resizable()
                    .frame(
                        width: DrawingConstants.NavigationBar.backButtonHeight,
                        height: DrawingConstants.NavigationBar.backButtonHeight
                    )
            }
            Spacer(minLength: 0)
            HStack(spacing: DrawingConstants.doubleSpacing) {
                additionalButtons()
                    .frame(height: DrawingConstants.NavigationBar.buttonsHeight, alignment: .trailing)
            }
        }
        .padding(.vertical, DrawingConstants.doubleSpacing)
    }
}

#Preview {
    NavigationBar {
        Circle().frame(height: 5).foregroundStyle(.red)
        Circle().frame(height: 20).foregroundStyle(.red)
    }
        .environmentObject(Coordinator())
}
