//
//  MenuBarButton.swift
//  EffectiveMobileTest
//
//  Created by Alex on 13.03.24.
//

import SwiftUI

struct MenuBarButton: View {
    let tab: Coordinator.Page
    let isActiveTab: Bool
    let tapAction: () -> Void
    
    var body: some View {
        Button {
            tapAction()
        } label: {
            VStack(alignment: .center) {
                Image(tab.id)
                    .resizable()
                    .frame(
                        width: DrawingConstants.MenuBar.imageSize,
                        height: DrawingConstants.MenuBar.imageSize
                    )
                Text(LocalizedStringKey(tab.id.localizedCapitalized))
                    .font(.tabText())
            }
            
            .frame(
                height: DrawingConstants.MenuBar.height)
        }
        .foregroundStyle(isActiveTab ? Color.accentColor : .placeholder)
    }
}

#Preview {
    MenuBarButton(tab: .profile, isActiveTab: true, tapAction: {})
}
