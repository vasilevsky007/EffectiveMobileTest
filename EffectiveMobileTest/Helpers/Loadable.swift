//
//  Loadable.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import Foundation

enum Loadable<T> {
    
    case notLoaded(error: Error?)
    case loading(last: T?)
    case loaded(T)
    
    var value: T? {
        switch self {
        case let .loaded(value): return value
        case let .loading(last): return last
        default: return nil
        }
    }
    var error: Error? {
        switch self {
        case let .notLoaded(error): return error
        default: return nil
        }
    }
    
    var isLoading: Bool {
        switch self {
        case .loading(_):
            return true
        default:
            return false
        }
    }
}

extension Loadable: Equatable where T: Equatable {
    static func == (lhs: Loadable<T>, rhs: Loadable<T>) -> Bool {
        switch (lhs, rhs) {
        case let (.loading(lhsV), .loading(rhsV)): return lhsV == rhsV
        case let (.loaded(lhsV), .loaded(rhsV)): return lhsV == rhsV
        case let (.notLoaded(lhsE), .notLoaded(rhsE)):
            return lhsE?.localizedDescription == rhsE?.localizedDescription
        default: return false
        }
    }
}
