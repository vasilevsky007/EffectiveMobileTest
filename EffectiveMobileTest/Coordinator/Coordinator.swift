//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

class Coordinator: ObservableObject {
    enum Page: String, Identifiable {
        case login, loginCode, search, vacancy, favourites
        
        var id: String {
            self.rawValue
        }
    }
    
    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
//    @Published var fullScreenCover: FullScreenCover?
    
    @Published var root = Page.login
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func changeRoot(to page: Page) {
        path.removeLast(path.count)
        root = page
    }
    
    @ViewBuilder func view (for page: Page) -> some View {
        switch page {
        case .login:
            EmptyView()
        case .loginCode:
            EmptyView()
        case .search:
            EmptyView()
        case .vacancy:
            EmptyView()
        case .favourites:
            EmptyView()
        }
    }
}
