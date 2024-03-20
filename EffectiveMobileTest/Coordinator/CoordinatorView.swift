//
//  CoordinatorView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

/// The main view of the app, using coordinator to manage navigation.
///
/// `CoordinatorView` manages the navigation stack and provides a centralized point for coordinating navigation within the app.
///
/// Use this view as the root view of your SwiftUI app to handle navigation and display different screens based on the current navigation state.
struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    @StateObject var app = WorkAppSwiftUI()
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationStack(path: $coordinator.path) {
                ZStack {
                    Color.pageBackground
                    coordinator.view(for: coordinator.root)
                        .padding(.horizontal, DrawingConstants.doubleSpacing)
                        .background(.pageBackground)
                        .transition(.push(from: coordinator.pushDirection))
                        .navigationDestination(for: Coordinator.Page.self) { page in
                            coordinator.view(for: page)
                                .transition(.push(from: coordinator.pushDirection))
                                .padding(.horizontal, DrawingConstants.doubleSpacing)
                                .background(.pageBackground)
                                .toolbar(.hidden, for: .navigationBar)
                        }
                        
                }.toolbar(.hidden, for: .navigationBar)
            }
            .background(.pageBackground)
                
            Divider()
                .padding(.bottom,DrawingConstants.standardSpacing)
            
            MenuBar()
                .ignoresSafeArea(.keyboard)
        }
        .environmentObject(coordinator)
        .environmentObject(app)
        .ignoresSafeArea(.keyboard)
        .background(.pageBackground)
    }
}

#Preview {
    CoordinatorView()
}
