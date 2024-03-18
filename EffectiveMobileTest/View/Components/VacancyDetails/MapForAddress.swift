//
//  MapForAddress.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import SwiftUI
import MapKit

struct MapForAddress: View {
    var address: Vacancy.Address
    
    @State private var mark: MKMapItem?
    
    var body: some View {
        Map(bounds: .init(MapCameraBounds(minimumDistance: 2000))) {
            if let mark = mark {
                Marker(item: mark)
                    .tint(.blue)
            }
        }
        .mapControlVisibility(.hidden)
        .disabled(true)
        .task {
            mark = await AddressDecoder.getMapItem(from: address)
        }
    }
}

#Preview {
    MapForAddress(address: .init(street: "улица Бирюзова", house: "4/5", town: "Минск"))
}
