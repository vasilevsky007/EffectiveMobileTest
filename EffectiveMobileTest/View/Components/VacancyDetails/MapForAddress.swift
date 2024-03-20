//
//  MapForAddress.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import SwiftUI
import MapKit

/// A map view displaying the location of an address.
///
/// `MapForAddress` displays a map with a marker indicating the location of a given address.
///
/// Use ``init(address:)`` to create a map view for displaying the location of a specific address.
struct MapForAddress: View {
    private let address: Vacancy.Address
    
    @State private var mark: MKMapItem?
    
    /// Initializes a new instance of ``MapForAddress``.
    /// - Parameter address: The address for which to display the map.
    init(address: Vacancy.Address) {
        self.address = address
    }
    
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
