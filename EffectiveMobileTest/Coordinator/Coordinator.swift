//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

/// A coordinator class responsible for managing navigation within the app.
///
/// `Coordinator` handles navigation between different screens or pages in the app. It defines various pages that can be navigated to and provides methods for pushing, popping, and changing tabs.
///
/// Use this coordinator to maintain a consistent and structured navigation flow within your SwiftUI app.
class Coordinator: ObservableObject {
    /// Enumeration defining different pages (or screens) in the app.
    enum Page {
        case login, loginCode, search, favourites, responses, messages, profile
        case vacancyDetails(Vacancy)
    }
    
    /// An array representing the tabs available in the app.
    let tabs: [Page] = [.search, .favourites, .responses, .messages, .profile]
    
    /// Navigation path representing the current navigation stack.
    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
//    @Published var fullScreenCover: FullScreenCover?
    
    /// The root page of the app.
    @Published var root = Page.login
    /// The direction of the push animation.
    @Published var pushDirection = Edge.trailing
    
    /// Pushes a new page onto the navigation stack.
    func push(_ page: Page) {
        withAnimation{
            path.append(page)
        }
    }
    
    /// Pops the top page from the navigation stack.
    func pop() {
        withAnimation {
            path.removeLast()
        }
    }
    
    /// Pops all pages from the navigation stack, leaving only the root page.
    func popToRoot() {
        withAnimation {
            path.removeLast(path.count)
        }
    }
    
    /// Changes the active tab to the specified page.
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
    
    /// Retrieves the view associated with a given page.
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
