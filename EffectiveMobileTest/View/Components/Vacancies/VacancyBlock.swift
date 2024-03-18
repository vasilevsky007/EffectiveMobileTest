//
//  VacancyBlock.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import SwiftUI

struct VacancyBlock: View {
    @EnvironmentObject private var app: WorkAppSwiftUI
    @EnvironmentObject private var coordinator: Coordinator
    
    var vacancy: Vacancy
    
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
                .foregroundStyle(.white)
            
            CapsuleButton(text: "Respond") {}
        }
            .overlay(alignment: .topTrailing) {
                Button {
                    app.toggleFavourites(on: vacancy)
                } label: {
                    Image(vacancy.isFavorite ? .favouritesFilled : .favourites)
                        .resizable()
                        .foregroundStyle(
                            vacancy.isFavorite ?
                            Color.accentColor :
                            .placeholder
                        )
                        .frame(
                            width: DrawingConstants.VacancyBlock.overlayImageSize,
                            height: DrawingConstants.VacancyBlock.overlayImageSize
                        )
                }
                .buttonStyle(.plain)
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
                isFavorite: false,
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
