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
        Text(vacancy.title).foregroundStyle(.white).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//#Preview {
//    VacancyDetailsView(vacancy: <#Vacancy#>)
//}
