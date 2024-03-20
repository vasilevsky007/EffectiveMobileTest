//
//  FavouritesView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import SwiftUI

/// A view for displaying a list of favorite job vacancies.
///
/// `FavouritesView` presents a scrollable list of job vacancies marked as favorites by the user. It allows users to quickly access and view the details of their favorite vacancies.
///
/// Use this view to provide users with easy access to job vacancies they have marked as favorites and enhance their browsing experience.
struct FavouritesView: View {
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
                if app.vacancies.isLoading {
                    // тут спорное решение, я мог бы сделать чисто на .refreshable {} и не добавлять свой спиннер,
                    // и выглядело бы лучше, без этого двойного спиннера когда ты отпускаешь палец после оттягивания страницы вниз,
                    // но тогда пришлось бы делать WorkAppSwiftUI.loadVacancies() асинхронной, и производить загрузку в ней,
                    // (а не отправлять таску на бэкграунд поток), т к спиннер в .refreshable {} показывается пока не исполнить блок кода внутри.
                    // но так как WorkAppSwiftUI является @MainActor, то проводилась бы загрузка и декодирование данных на главном потоке,
                    // что в общем то не очень хорошо, так что тут палка о двух концах. с точки зрения архитектуры то как сделла я явно лучше,
                    // но тут нужно бы подумать как исправить интерфейсную часть.
                    ProgressView()
                        .scaleEffect(1.5, anchor: .top)
                        .padding(.bottom, DrawingConstants.standardSpacing)
                        .containerRelativeFrame(.horizontal, alignment: .center)
                }
                
                Text(LocalizedStringKey(Coordinator.Page.favourites.id.localizedCapitalized))
                    .font(.title2())
                    .foregroundStyle(.white)
                    .padding(.bottom, DrawingConstants.standardSpacing)
                
                Text("\(app.favouritesNumber) vacancies")
                    .font(.text1())
                    .foregroundStyle(Color.placeholder)
                
                if let error = app.vacancies.error {
                    Text(error.localizedDescription)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
                
                
                Group {
                    ForEach (app.favouriteVacancies) { vacancy in
                        VacancyBlock(vacancy: vacancy)
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .scrollIndicators(.never)
        .refreshable {
            app.loadVacancies()
        }
        .task {
            if app.vacancies.value == nil {
                app.loadVacancies()
            }
        }
        
    }
}

#Preview {
    FavouritesView()
        .environmentObject(WorkAppSwiftUI())
}
