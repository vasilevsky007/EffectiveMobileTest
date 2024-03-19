//
//  NavigationBar.swift
//  EffectiveMobileTest
//
//  Created by Alex on 19.03.24.
//

import SwiftUI

struct NavigationBar<Content>: View where Content: View{
    @EnvironmentObject private var coordinator: Coordinator
    @ViewBuilder var additionalButtons: () -> Content
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                coordinator.pop()
            } label: {
                Image(.back)
                    .resizable()
                    .frame(
                        width: DrawingConstants.NavigationBar.backButtonHeight,
                        height: DrawingConstants.NavigationBar.backButtonHeight
                    )
            }
            Spacer(minLength: 0)
            HStack(spacing: DrawingConstants.doubleSpacing) {
                additionalButtons()
                    .frame(height: DrawingConstants.NavigationBar.buttonsHeight, alignment: .trailing)
            }
        }
        .padding(.vertical, DrawingConstants.doubleSpacing)
    }
}

#Preview {
    NavigationBar {
        Circle().frame(height: 5).foregroundStyle(.red)
        Circle().frame(height: 20).foregroundStyle(.red)
    }
        .environmentObject(Coordinator())
}
