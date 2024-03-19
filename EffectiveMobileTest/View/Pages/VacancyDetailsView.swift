//
//  VacancyDetailsView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import SwiftUI

struct VacancyDetailsView: View {
    @EnvironmentObject private var app: WorkAppSwiftUI
    
    var vacancy: Vacancy
    
    //вообще по-хорошему бы передавать только айдишник,
    //и тогда все данные на экране будут инвалидироваться при изменении модели,
    //а не саму вакансию(поскольку это копия, а так как передавший ее сюда View офсскрин,
    //он не булет инвалидировать VacancyDetailsView при изменении этой вакансии в модели),
    //но тогда либо брать и вообще все мои  @ViewBuilder ы которые я сделал загонять в body (что ухудшит читаемость кода),
    //где сделать optional binding полученного из VM по id Vacancy,
    //либо что еще хуже делать force unwrap полученнчх из VM данных, что может привести к крашам
    private var isFavourite: Bool {
        if let isFavourite = app.vacancies.value?.first(where: {$0.id == vacancy.id})?.isFavorite {
            return isFavourite
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationBar {
                navigationBarButtons
            }
            
            ScrollView(.vertical) {
                header
                
                VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
                    mainInfo
                    
                    communication
                }.padding(.vertical, DrawingConstants.standardSpacing)
            }.scrollIndicators(.never)
        }
    }
    
    @ViewBuilder var navigationBarButtons: some View {
        Button {} label: {
            Image(.show)
                .resizable()
                .frame(
                    width: DrawingConstants.NavigationBar.buttonsHeight,
                    height: DrawingConstants.NavigationBar.buttonsHeight
                )
        }
        Button {} label: {
            Image(.share)
                .resizable()
                .frame(
                    width: DrawingConstants.NavigationBar.backButtonHeight,
                    height: DrawingConstants.NavigationBar.backButtonHeight
                )
        }
        SwitchButton(state: isFavourite, imageTrue: .favouritesFilled, imageFalse: .favourites) {
            app.toggleFavourites(on: vacancy)
        }
    }
    
    @ViewBuilder var header: some View  {
        VStack(alignment: .leading, spacing: DrawingConstants.tripleSpacing) {
            VStack(alignment: .leading, spacing: DrawingConstants.doubleSpacing) {
                Text(vacancy.title)
                    .font(.title1())
                
                
                if let salary = vacancy.salary.full {
                    Text(salary)
                        .font(.text1())
                }
                VStack(alignment: .leading, spacing: DrawingConstants.halfSpacing) {
                    Text("Relevant experience: \(vacancy.experience.text)")
                        .font(.text1())
                    Text(verbatim: .enumeration(of: vacancy.schedules))
                        .font(.text1())
                }
            }.foregroundStyle(.white)
            
            if vacancy.appliedNumber != nil || vacancy.lookingNumber != nil {
                HStack(spacing: DrawingConstants.standardSpacing) {
                    if let appliedNumber = vacancy.appliedNumber {
                        LiveInfoBlock(text: "\(appliedNumber) people have already responded", image: .profile)
                    }
                    if let lookingNumber = vacancy.lookingNumber {
                        LiveInfoBlock(text: "\(lookingNumber) people are currently viewing this vacancy", image: .show)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: DrawingConstants.standardSpacing) {
                HStack(alignment: .center, spacing: DrawingConstants.standardSpacing) {
                    Text(vacancy.company)
                        .font(.title3())
                        .foregroundStyle(.white)
                    
                    Image(.approved)
                        .resizable()
                        .frame(
                            width: DrawingConstants.doubleSpacing,
                            height: DrawingConstants.doubleSpacing
                        )
                }
                
                MapForAddress(address: vacancy.address)
                    .frame(height: 60)
                    .clipShape(.rect(cornerRadius: DrawingConstants.cornerRadius))
                
                Text(vacancy.address.description)
                    .font(.text1())
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, DrawingConstants.doubleSpacing)
            .padding(.vertical, DrawingConstants.VacancyDetailsView.mapBlockVerticalPadding)
            .background(.blockBackground, in: .rect(cornerRadius: DrawingConstants.cornerRadius))
            
            
        }.padding(.vertical, DrawingConstants.standardSpacing)
        
    }
    
    @ViewBuilder var mainInfo: some View {
        if let description = vacancy.description {
            Text(description)
                .font(.text1())
                .foregroundStyle(.white)
        }
        
        VStack(alignment: .leading, spacing: DrawingConstants.standardSpacing) {
            Text("Your responsibilities")
                .font(.title2())
                .foregroundStyle(.white)
            
            Text(vacancy.responsibilities)
                .font(.text1())
                .foregroundStyle(.white)
        }
    }
    
    @ViewBuilder var communication: some View {
        VStack(alignment: .leading, spacing: DrawingConstants.standardSpacing) {
            Text("Ask a question to the employer")
                .font(.title4())
                .foregroundStyle(.white)
                .padding(.top, DrawingConstants.doubleSpacing)
            
            Text("He or she will receive it with the response to the vacancy")
                .font(.title4())
                .foregroundStyle(Color.secondaryContent)
        }
        
        VStack(alignment: .leading, spacing: DrawingConstants.standardSpacing) {
            Group {
                ForEach(vacancy.questions.indices) { index in
                    Button {
                    } label: {
                        Text(vacancy.questions[index])
                            .font(.title4())
                            .foregroundStyle(.white)
                            .padding(.vertical, DrawingConstants.standardSpacing)
                            .padding(.horizontal, DrawingConstants.VacancyDetailsView.questionHorizontalPadding)
                            .background(Color.controlBackground, in: .capsule)
                    }

                    
                }
            }
        }
        
        RoundedButton(text: "Ask a question to the employer", height: 48, color: .salad) { }
            .font(.buttonText1())
        
            .padding(.bottom, DrawingConstants.standardSpacing)
    }
}

#Preview {
    return VacancyDetailsView(
        vacancy: Vacancy(
            id: "qwe",
            schedules: ["sc1", "sc2", "sc3"],
            description: "descr",
            lookingNumber: 12,
            isFavorite: true,
            appliedNumber: 53,
            salary: .init(full: "sal", short: ""),
            company: "Comp",
            publishedDate: .now,
            title: "title",
            address: .init(street: "улица Бирюзова", house: "4/5", town: "Минск"),
            responsibilities: "resp",
            questions: ["a","a","a","a","a","a","a"],
            experience: .init(text: "expT", previewText: "expP")
        )
    ).environmentObject(WorkAppSwiftUI())
}
