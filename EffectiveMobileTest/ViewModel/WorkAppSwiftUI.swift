//
//  WorkAppSwiftUI.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

/// A view model for managing application state and data related to the Work App in SwiftUI.
@MainActor class WorkAppSwiftUI: ObservableObject {
    // MARK: - Published Variables
    /// The currently authenticated user.
    @Published var currentUser: User?
    /// The current state of vacancies, for more detailed info refer to ``Loadable`` and ``Vacancy``
    @Published var vacancies: Loadable<[Vacancy]> = .notLoaded(error: nil)
    
    // MARK: - Private Variables
    private var webRepository = VacanciesWebRepository()
    
    // MARK: - Computed Variables
    /// A Boolean value indicating whether a user is authenticated.
    var isAuthenticated: Bool {
        guard let currentUser = currentUser else { return false }
        return currentUser.isAuthenticated
    }
    
    /// The number of favorite vacancies.
    var favouritesNumber: Int {
        guard let vacancies = vacancies.value else { return 0 }
        var number = 0
        for vacancy in vacancies {
            if vacancy.isFavorite {
                number += 1
            }
        }
        return number
    }
    
    /// An array containing only the favorite vacancies.
    var favouriteVacancies: [Vacancy] {
        guard let vacancies = vacancies.value else { return [] }
        var favourite: [Vacancy] = []
        for vacancy in vacancies {
            if vacancy.isFavorite {
                favourite.append(vacancy)
            }
        }
        return favourite
    }
    
    // MARK: - User Intents
    /// Starts the user authentication process with the provided email address.
    /// - Parameter email: The email address of the user.
    func startUserAuthentication(with email: EmailAddress) {
        withAnimation {
            currentUser = User(email: email)
        }
    }
    
    /// Ends the user authentication process with the provided secure code.
    /// - Parameter code: The authentication code.
    func endUserAuthentication(with code: String) {
        withAnimation {
            currentUser?.saveToken(code)
        }
    }
    
    /// Loads vacancies from the web API.
    func loadVacancies () {
        vacancies = .loading(last: vacancies.value)
        Task.detached {
            do {
                let newVacancies = try await self.webRepository.getAllVacancies()
                Task {
                    await self.saveVacaniesLoaded(newVacancies)
                }
            } catch {
                Task {
                    await self.errorLoadingVacancies(error)
                }
            }
        }
    }
    
    /// Toggles the favorite status of the provided vacancy.
    /// - Parameter vacancy: The vacancy to toggle the favorite status for.
    func toggleFavourites(on vacancy: Vacancy) {
        if let vacancies = vacancies.value {
            guard let index = vacancies.firstIndex(where: { $0.id == vacancy.id }) else { return }
            var newVacancies = vacancies
            newVacancies[index].isFavorite.toggle()
            switch self.vacancies {
            case .notLoaded(_):
                return
            case .loading(_):
                withAnimation{
                    self.vacancies = .loading(last: newVacancies)
                }
            case .loaded(_):
                withAnimation{
                    self.vacancies = .loaded(newVacancies)
                }
            }
        }
    }
    
    private func saveVacaniesLoaded(_ vacancies: [Vacancy]) {
        withAnimation {
            self.vacancies = .loaded(vacancies)
        }
    }
    private func errorLoadingVacancies(_ error: Error) {
        withAnimation {
            self.vacancies = .notLoaded(error: error)
        }
    }
}
