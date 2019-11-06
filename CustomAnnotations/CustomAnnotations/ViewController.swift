//
//  ViewController.swift
//  CustomAnnotations
//
//  Created by Szabolcs Toth on 06/11/2019.
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
            addAnnotations()
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
    
    func addAnnotations() {
        let airportDeparture = MKPointAnnotation()
       airportDeparture.title = "BUD"
        airportDeparture.coordinate = CLLocationCoordinate2D(latitude: 47.439444, longitude: 19.261944)

        let airportArrival = MKPointAnnotation()
        airportArrival.title = "FRA"
        airportArrival.coordinate = CLLocationCoordinate2D(latitude: 50.033333, longitude: 8.570556)
        let locationsArray: [MKPointAnnotation] = [airportDeparture, airportArrival ]

        mapView.showAnnotations(locationsArray, animated: true)
        mapView.setRegion(regionFor(coordinates: [airportArrival.coordinate, airportDeparture.coordinate]), animated: true)
        
        var locations = locationsArray.map { $0.coordinate }
        let polyline = MKPolyline(coordinates: &locations, count: locations.count)
        mapView?.addOverlay(polyline)
  
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
           if overlay is MKPolyline {
                let renderer = MKPolylineRenderer(overlay: overlay)
                renderer.strokeColor = NSColor.white
                renderer.lineWidth = 1
                return renderer
            }
        
        return MKOverlayRenderer()
    }
    
    // Source: https://stackoverflow.com/questions/1336370/positioning-mkmapview-to-show-multiple-annotations-at-once/1343448
    
    func regionFor(coordinates coords: [CLLocationCoordinate2D]) -> MKCoordinateRegion {
        var r = MKMapRect.null

        for i in 0 ..< coords.count {
            let p = MKMapPoint(coords[i])

            r = r.union(MKMapRect(x: p.x, y: p.y, width: 0, height: 0))
        }

        return MKCoordinateRegion(r)
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAutherization()
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
    
        if annotationView == nil  {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        annotationView?.image = NSImage(named: "windshock")
        
        return annotationView
    }
}

