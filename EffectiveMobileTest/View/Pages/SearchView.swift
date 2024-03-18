//
//  SearchView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    private let displayingCount = 3
    
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
            HStack(alignment: .center, spacing: DrawingConstants.standardSpacing) {
                PrettyTextField(text: .constant(""), placehoderText: "Job title, keywords", placeholderImage: "search")
                SmallRoundedButton(imageName: "filter") {}
            }
            
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
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: DrawingConstants.standardSpacing) {
                            OfferBlock(
                                imageName: "location",
                                imageBackground: .accentDisabled,
                                title: "Vacancies near you"
                            )
                            OfferBlock(
                                imageName: "star",
                                imageBackground: .saladDisabled,
                                title: "Boost your resume in the search",
                                buttonTitle: "Boost"
                            )
                            OfferBlock(
                                imageName: "note",
                                imageBackground: .saladDisabled,
                                title: "Temporary and part-time work"
                            )
                        }
                    }.scrollIndicators(.never)
                        .padding(.top, DrawingConstants.doubleSpacing)
                    
                    Text("Vacancies for you")
                        .font(.title2())
                        .foregroundStyle(.white)
                    
                    if let error = app.vacancies.error {
                        Text(error.localizedDescription)
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                    
                    if let vacancies = app.vacancies.value {
                        let shownVacancies = vacancies.prefix(displayingCount)
                        Group {
                            ForEach (shownVacancies) { vacancy in
                                VacancyBlock(vacancy: vacancy)
                            }
                            RoundedButton(text: "Another \(vacancies.count) vacancies") { }
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
}

#Preview {
    SearchView()
        .environmentObject(WorkAppSwiftUI())
}
