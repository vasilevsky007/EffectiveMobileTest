//
//  MenuBarButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

/// A button representing a tab in the menu bar.
///
/// `MenuBarButton` displays an icon and text representing a specific tab in the application menu bar. It can be tapped to navigate to the corresponding tab.
///
/// Use ``init(tab:isActiveTab:tapAction:)`` to create a menu bar button for a specific tab.
struct MenuBarButton: View {
    private let tab: Coordinator.Page
    private let isActiveTab: Bool
    private let tapAction: () -> Void
    
    /// Initializes a new instance of ``MenuBarButton``.
    /// - Parameters:
    ///   - tab: The tab represented by the button.
    ///   - isActiveTab: A Boolean value indicating whether the tab is currently active.
    ///   - tapAction: The closure to execute when the button is tapped.
    init(tab: Coordinator.Page, isActiveTab: Bool, tapAction: @escaping () -> Void) {
        self.tab = tab
        self.isActiveTab = isActiveTab
        self.tapAction = tapAction
    }
    
    var body: some View {
        Button {
            tapAction()
        } label: {
            VStack(alignment: .center) {
                Image(tab.id)
                    .resizable()
                    .frame(
                        width: DrawingConstants.MenuBar.imageSize,
                        height: DrawingConstants.MenuBar.imageSize
                    )
                Text(LocalizedStringKey(tab.id.localizedCapitalized))
                    .font(.tabText())
            }
            
            .frame(
                height: DrawingConstants.MenuBar.height)
        }
        .foregroundStyle(isActiveTab ? Color.accentColor : .placeholder)
    }
}

#Preview {
    MenuBarButton(tab: .profile, isActiveTab: true, tapAction: {})
}
