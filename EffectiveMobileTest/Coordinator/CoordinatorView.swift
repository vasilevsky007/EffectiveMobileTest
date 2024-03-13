//
//  CoordinatorView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        VStack {
            NavigationStack(path: $coordinator.path) {
                coordinator.view(for: coordinator.root)
            }
            Spacer()
            MenuBar()
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
