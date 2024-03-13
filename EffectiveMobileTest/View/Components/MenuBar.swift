//
//  MenuBar.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

struct MenuBar: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var activeTab: Tab? {
        return Tab(rawValue: coordinator.root.rawValue)
    }
    
    var body: some View {
        LazyVGrid(
            columns: .init(
                repeating: .init(
                    .flexible(minimum: .zero, maximum: .greatestFiniteMagnitude),
                    spacing: nil,
                    alignment: .center
                ),
                count: Tab.allCases.count
            ),
            alignment: .center,
            spacing: 0,
            content: {
                ForEach(Tab.allCases) { tab in
                    MenuBarButton(
                        tab: tab,
                        isActiveTab: activeTab == tab
                    ) {
                        if (activeTab != tab) {
                            guard let page = Coordinator.Page(rawValue: tab.rawValue) else { return }
                            coordinator.changeRoot(to: page)
                        }
                    }
                }
        })
    }
}

extension MenuBar {
    enum Tab: String, Identifiable, CaseIterable {
        case search, favourites, responses, messages, profile
        var id: String {
            self.rawValue
        }
    }
}

#Preview {
    let coordinator = Coordinator()
    return MenuBar()
        .environmentObject(coordinator)
}
