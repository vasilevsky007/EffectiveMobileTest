//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

class Coordinator: ObservableObject {
    enum Page: String, Identifiable {
        case login, loginCode, search, vacancy, favourites, responses, messages, profile
        
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
    
    func changeTab(to page: Page) {
        if root != .login && root != .loginCode {
            path.removeLast(path.count)
            root = page
        }
    }
    
    @ViewBuilder func view (for page: Page) -> some View {
        switch page {
        case .login:
            LoginView()
        case .loginCode:
            Text(page.name)
        case .search:
            Text(page.name)
        case .vacancy:
            Text(page.name)
        case .favourites:
            Text(page.name)
        case .responses:
            Text(page.name)
        case .messages:
            Text(page.name)
        case .profile:
            Text(page.name)
        }
    }
}

extension Coordinator.Page {
    var name: String {
        switch self {
        case .login:
            return "Вход в личный кабинет"
        case .loginCode:
            return ""
        case .search:
            return "поиск"
        case .vacancy:
            return ""
        case .favourites:
            return "избранное"
        case .responses:
            return "отклики"
        case .messages:
            return "сообщения"
        case .profile:
            return "профиль"
        }
    }
}
