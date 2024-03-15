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
        VStack(spacing: DrawingConstants.standardSpacing) {
            NavigationStack(path: $coordinator.path) {
                coordinator.view(for: coordinator.root)
                    .padding(.horizontal, DrawingConstants.doubleSpacing)
                    .background(.pageBackground)
                    .navigationDestination(for: Coordinator.Page.self) { page in
                        coordinator.view(for: page)
                    }
            }
                
            Divider()
            MenuBar()
                .ignoresSafeArea(.keyboard)
        }
        .environmentObject(coordinator)
        .ignoresSafeArea(.keyboard)
        .background(.pageBackground)
    }
}

#Preview {
    CoordinatorView()
}
