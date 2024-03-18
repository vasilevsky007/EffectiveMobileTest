//
//  AddressDecoder.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import Foundation
import MapKit

struct AddressDecoder {
    static private let geocoder = CLGeocoder()
    
    static func getMapItem(from address: Vacancy.Address) async -> MKMapItem? {
        guard let locationPlacemarks = try? await geocoder.geocodeAddressString(address.description),
              let locationPlacemark = locationPlacemarks.first
        else { return nil }
        return .init(placemark: .init(placemark: locationPlacemark))
    }
}
