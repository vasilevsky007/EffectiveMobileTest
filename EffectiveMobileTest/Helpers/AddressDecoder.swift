//
//  AddressDecoder.swift
//  EffectiveMobileTest
//
//  Created by Alex on 18.03.24.
//

import Foundation
import MapKit

/// A utility struct for decoding addresses into somesthing we can display on `MapKit Map`
struct AddressDecoder {
    static private let geocoder = CLGeocoder()
    
    /// Retrieves an `MKMapItem` asynchronously from the provided address.
    /// - Parameters:
    ///   - address: The address information to decode.
    /// - Returns: An `MKMapItem` representing the location, or `nil` if decoding fails.
    static func getMapItem(from address: Vacancy.Address) async -> MKMapItem? {
        guard let locationPlacemarks = try? await geocoder.geocodeAddressString(address.description),
              let locationPlacemark = locationPlacemarks.first
        else { return nil }
        return .init(placemark: .init(placemark: locationPlacemark))
    }
}
