//
//  VacancyBlock.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

/// A block representing a job vacancy.
///
/// `VacancyBlock` displays brief information about a job vacancy, including its title, salary, location, company, experience required, and publication date. Users can respond to the vacancy or mark it as a favorite.
///
/// Use ``init(vacancy:)`` to create a block for displaying a specific job vacancy.
struct VacancyBlock: View {
    @EnvironmentObject private var app: WorkAppSwiftUI
    @EnvironmentObject private var coordinator: Coordinator
    
    private let vacancy: Vacancy
    
    /// Initializes a new instance of ``VacancyBlock``.
    /// - Parameter vacancy: The job vacancy to display.
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.VacancyBlock.spacing) {
            if let lookingNumber = vacancy.lookingNumber, lookingNumber > 0 {
                Text("There are currently \(lookingNumber) viewers")
                    .font(.text1())
                    .foregroundStyle(.salad)
            }
            
            Text(vacancy.title)
                .font(.title3())
                .foregroundStyle(.white)
            
            if let salary = vacancy.salary.short {
                Text(salary)
                    .font(.title2())
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: DrawingConstants.halfSpacing) {
                Text(vacancy.address.town)
                    .font(.text1())
                    .foregroundStyle(.white)
                HStack(alignment: .center, spacing: DrawingConstants.standardSpacing) {
                    Text(vacancy.company)
                        .font(.text1())
                        .foregroundStyle(.white)
                    Image(.approved)
                        .frame(width: DrawingConstants.doubleSpacing, height: DrawingConstants.doubleSpacing)
                }
            }
                .foregroundStyle(.white)
            
            HStack(alignment: .center, spacing: DrawingConstants.standardSpacing) {
                Image(.work)
                    .frame(width: DrawingConstants.doubleSpacing, height: DrawingConstants.doubleSpacing)
                Text(vacancy.experience.previewText)
                    .font(.text1())
                    .foregroundStyle(.white)
            }
                .foregroundStyle(.white)
            
            Text(publishedText)
                .font(.text1())
                .foregroundStyle(.secondaryContent)
            
            CapsuleButton(text: "Respond") {}
        }
            .overlay(alignment: .topTrailing) {
                SwitchButton(
                    state: vacancy.isFavorite,
                    imageTrue: .favouritesFilled,
                    imageFalse: .favourites
                ) {
                    app.toggleFavourites(on: vacancy)
                }
                .foregroundStyle(Color.placeholder)
            }
            .padding(DrawingConstants.doubleSpacing)
            .background(Color.blockBackground, in: RoundedRectangle(cornerRadius: DrawingConstants.blockCornerRadius))
            .onTapGesture {
                coordinator.push(.vacancyDetails(vacancy))
            }
    }
    
    private var publishedText: LocalizedStringKey {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        var text = formatter.string(from: vacancy.publishedDate)
        let isRussian = Locale.current.language.languageCode == .russian
        //in RU locale adding " г." after year number, in EN not, need to check other locales before adding
        for _ in 0..<(isRussian ? 8 : 5) {
            text.removeLast()
        }
        return  "Published \(text)"
    }
}

#Preview {
    VacancyBlock(vacancy: 
            .init(
                id: "1",
                schedules: [],
                description: "asf",
                lookingNumber: 12,
                isFavorite: true,
                appliedNumber: 10,
                salary: .init(full: "", short: "1200BYN"),
                company: "dskl",
                publishedDate: .now,
                title: "Vac",
                address: .init(street: "s", house: "h", town: "t"),
                responsibilities: "dsjknlm",
                questions: [],
                experience: .init(text: "", previewText: "xzc")
            )
    )
        .environmentObject(WorkAppSwiftUI())
}
