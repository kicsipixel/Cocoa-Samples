//
//  ViewController.swift
//  MapKitmacOS
//
//  Created by Szabolcs Toth on 05/11/2019.
//  Copyright © 2019 purzelbaum.hu. All rights reserved.
//

import Cocoa
import MapKit
import CoreLocation

class ViewController: NSViewController {
    
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let regionMeter: Double = 10000

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAutherization()
        } else {
            showAlert(issue: "not enabled")
        }
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters:  regionMeter, longitudinalMeters:  regionMeter)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationAutherization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorized:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlert(issue: "denied")
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .restricted:
            showAlert(issue: "restricted")
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func showAlert(issue: String) {
        let alert = NSAlert()
        
        switch issue {
        case "not enabled":
            alert.messageText = "Enable Location Services"
            alert.informativeText = "Location services are not enabled. Please, check it in your Sytem Preferences."
            _ = alert.runModal()
        case "denied":
            alert.messageText = "Enable Location Services"
            alert.informativeText = "Location services are denied. Please, check it in your Sytem Preferences."
            _ = alert.runModal()
        default:
            alert.messageText = "Enable Location Services"
            alert.informativeText = "Location services are restricted. Please, check it in your Sytem Preferences."
            _ = alert.runModal()
        }
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionMeter, longitudinalMeters: regionMeter)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAutherization()
    }
}

