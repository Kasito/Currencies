//
//  MapViewController.swift
//  Currencies
//
//  Created by user on 12/6/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController, MKMapViewDelegate {
    
    var address: String = ""
   
    @IBOutlet weak private var mapView: MKMapView!
    
    let firstCoordinate = CLLocationCoordinate2D(latitude: 49.83239111258802, longitude: 24.043428897857666)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarStyle(.lightContent)
        
        self.mapView.delegate = self
        getCoordinate(location: address) { result in
            self.route(firstCoordinate: self.firstCoordinate, secondCoordinate: result) }
    }
    
    //MARK: - get coordinate
   private func getCoordinate(location : String, completion: @escaping (CLLocationCoordinate2D) -> ()) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { (placemarks, error) in
            guard let placemarks = placemarks, let location = placemarks.first?.location else { return }
            completion(location.coordinate)
        }
    }
    
    //MARK: - route
   private func route(firstCoordinate: CLLocationCoordinate2D, secondCoordinate: CLLocationCoordinate2D) {
        let firstAnnotation = MKPointAnnotation()
        firstAnnotation.title = "Ви тут"
        firstAnnotation.coordinate = firstCoordinate
        
        let secondAnnotation = MKPointAnnotation()
        secondAnnotation.title = "Bank"
        secondAnnotation.coordinate = secondCoordinate
        
        mapView.showAnnotations([firstAnnotation, secondAnnotation], animated: true)
        
        let firstItem = MKMapItem(placemark: MKPlacemark(coordinate: firstCoordinate))
        let secondItem = MKMapItem(placemark: MKPlacemark(coordinate: secondCoordinate))
        
        let request = MKDirections.Request()
        request.source = firstItem
        request.destination = secondItem
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            guard let response = response else {
                NSLog("error of requesting: \(error.debugDescription)")
                return
            }
            
            if  response.routes.count > 0 {
                let route = response.routes[0]
                self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                
                let  rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 4
        renderer.strokeColor = .blue
        return renderer
    }
}
