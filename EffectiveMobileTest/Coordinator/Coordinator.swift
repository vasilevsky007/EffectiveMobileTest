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
        case vacancyDetails(Vacancy)
    }
    
    let tabs: [Page] = [.search, .favourites, .responses, .messages, .profile]
    
    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
//    @Published var fullScreenCover: FullScreenCover?
    
    @Published var root = Page.login
    
    @Published var pushDirection = Edge.trailing
    
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
        if (root != page) {
            if (tabs.firstIndex(of: root) ?? Int.max < tabs.firstIndex(of: page) ?? Int.max) {
                pushDirection = .trailing
            } else {
                pushDirection = .leading
            }
            withAnimation {
                path.removeLast(path.count)
                root = page
            }
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
        case .vacancyDetails(let vacancy):
            VacancyDetailsView(vacancy: vacancy)
        case .favourites:
            FavouritesView()
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
        case .vacancyDetails(let vacancy):
            return vacancy.id
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
