//
//  LocationManager.swift
//  MapPractivce
//
//  Created by Mobarak on 10/26/21.
//

import CoreLocation
import Foundation
import MapKit
class LocationManager:NSObject ,CLLocationManagerDelegate {
    static let shared = LocationManager()
    let manager = CLLocationManager()
    var completion : ((CLLocation)->Void)?
    
    func getUserLocation(completion: @escaping ((CLLocation)->Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
  
    func resolveLocationName(with location:CLLocation,completion:@escaping ((String?)->Void)) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current){ placemarks, error in
            guard let place = placemarks?.first, error == nil else{
                completion(nil)
                return
            }
            print(place)
            var name = ""
            
            if let locality = place.locality{
                name += locality
            }
            
            if let adminRegion = place.administrativeArea{
                name += ", \(adminRegion)"
            }
            
            completion(name)
        }
    }
    
    func getLocationFromMap(with mapView:MKMapView) -> CLLocation {
        let lat = mapView.centerCoordinate.latitude
        let long = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: lat, longitude: long)

    }
}
