//
//  MenuBar.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

/// A menu bar view.
///
/// `MenuBar` displays a horizontal bar of buttons representing different tabs or sections of an application. Each button corresponds to a specific tab and can be tapped to navigate to that tab.
///
/// Use ``init()`` to add a menu bar for your view.
struct MenuBar: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    /// Initializes a new instance of ``MenuBar``.
    init() {}
    
    private var activeTab: Coordinator.Page? {
        return coordinator.tabs.contains(coordinator.root) ? coordinator.root : nil
    }
    
    var body: some View {
        LazyVGrid(
            columns: .init(
                repeating: .init(
                    .flexible(minimum: .zero, maximum: .greatestFiniteMagnitude),
                    spacing: nil,
                    alignment: .center
                ),
                count: coordinator.tabs.count
            ),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(coordinator.tabs) { tab in
                MenuBarButton(
                    tab: tab,
                    isActiveTab: activeTab == tab
                ) {
                    if app.isAuthenticated {
                        coordinator.changeTab(to: tab)
                    }
                }
                .numberSticker(number: tab == .favourites ? app.favouritesNumber : 0)
            }
        }
    }
}

#Preview {
    return MenuBar()
        .environmentObject(Coordinator())
        .environmentObject(WorkAppSwiftUI())
}
