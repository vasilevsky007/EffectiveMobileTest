//
//  VacancyDetailsView.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import SwiftUI

struct VacancyDetailsView: View {
    var vacancy: Vacancy
    
    var body: some View {
        MapForAddress(address: vacancy.address)
    }
}

#Preview {
    return VacancyDetailsView(
        vacancy: Vacancy(
            id: "qwe",
            schedules: [],
            description: "",
            lookingNumber: 12,
            isFavorite: true,
            appliedNumber: 53,
            salary: .init(full: "", short: ""),
            company: "",
            publishedDate: .now,
            title: "ksad",
            address: .init(street: "улица Бирюзова", house: "4/5", town: "Минск"),
            responsibilities: "",
            questions: [],
            experience: .init(text: "", previewText: "")
        )
    )
}
