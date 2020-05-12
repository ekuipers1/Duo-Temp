//
//  LocationManager.swift
//  Duo Temp
//
//  Created by Erik Kuipers on 5/1/20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {

private let geocoder = CLGeocoder()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var placemark: CLPlacemark? {
      willSet { objectWillChange.send() }
    }
    
    @Published var lastLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }

    private func geocode() {
      guard let location = self.location else { return }
      geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
        if error == nil {
          self.placemark = places?[0]
        } else {
          self.placemark = nil
        }
      })
    }
    
    
    @Published var location : CLLocation? = nil

    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }

        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }

    }

    let objectWillChange = PassthroughSubject<Void, Never>()

    private let locationManager = CLLocationManager()
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        print(#function, statusString)
        
    }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            self.lastLocation = location
            let geoCoder = CLGeocoder()
            //        print(#function, location)
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
                //        geoCoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
                if error == nil {
                    self.placemark = places?[0]
                } else {
                    self.placemark = nil
                }
            })
            
        }
    }

