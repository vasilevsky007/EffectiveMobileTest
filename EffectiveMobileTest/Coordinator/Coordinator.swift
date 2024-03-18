//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

class Coordinator: ObservableObject {
    enum Page {
        case login, loginCode, search, favourites, responses, messages, profile
        case vacancy(Vacancy)
    }
    
    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
//    @Published var fullScreenCover: FullScreenCover?
    
    @Published var root = Page.login
    
    func push(_ page: Page) {
        withAnimation{
            path.append(page)
        }
    }
    
    func pop() {
        withAnimation {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        withAnimation {
            path.removeLast(path.count)
        }
    }
    
    func changeTab(to page: Page) {
        withAnimation {
            path.removeLast(path.count)
            root = page
        }
    }
    
    @ViewBuilder func view (for page: Page) -> some View {
        switch page {
        case .login:
            LoginView()
        case .loginCode:
            LoginCodeView()
        case .search:
            SearchView()
        case .vacancy(let vacancy):
            VacancyDetailsView(vacancy: vacancy)
        case .favourites:
            Text(page.id).foregroundStyle(.white).frame(maxWidth: .infinity, maxHeight: .infinity)
        case .responses:
            Text(page.id).foregroundStyle(.white).frame(maxWidth: .infinity, maxHeight: .infinity)
        case .messages:
            Text(page.id).foregroundStyle(.white).frame(maxWidth: .infinity, maxHeight: .infinity)
        case .profile:
            Text(page.id).foregroundStyle(.white).frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

extension Coordinator.Page: Identifiable, Hashable {
    
    static func == (lhs: Coordinator.Page, rhs: Coordinator.Page) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String {
        switch self {
        case .login:
            return "login"
        case .loginCode:
            return "loginCode"
        case .search:
            return "search"
        case .vacancy(let vacancy):
            return vacancy.title
        case .favourites:
            return "favourites"
        case .responses:
            return "responses"
        case .messages:
            return "messages"
        case .profile:
            return "profile"
        }
    }

}
