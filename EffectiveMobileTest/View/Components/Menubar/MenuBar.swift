//
//  MenuBar.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

struct MenuBar: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    var tabs: [Coordinator.Page] = [.search, .favourites, .responses, .messages, .profile]
    
    var activeTab: Coordinator.Page? {
        return tabs.contains(coordinator.root) ? coordinator.root : nil
    }
    
    var body: some View {
        LazyVGrid(
            columns: .init(
                repeating: .init(
                    .flexible(minimum: .zero, maximum: .greatestFiniteMagnitude),
                    spacing: nil,
                    alignment: .center
                ),
                count: tabs.count
            ),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(tabs) { tab in
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
    let coordinator = Coordinator()
    return MenuBar()
        .environmentObject(coordinator)
}
