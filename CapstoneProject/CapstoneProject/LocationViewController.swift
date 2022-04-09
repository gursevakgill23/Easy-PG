//
//  LocationViewController.swift
//  CapstoneProject
//
//  Created by Gursevak Singh on 3/23/22.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var textAddress: UITextField!
    
    @IBOutlet weak var getDirectionBtn: UIButton!
    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager ()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
     //Make map visable and set initial location
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.delegate = self
        textAddress.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textAddress.resignFirstResponder()    }
// trigger new location address and run location
    @IBAction func getDirection(_ sender: Any) {
     convertAddress()
    }
  

    
    
    // converts address from text to coordinates Longtide and latitude
    func convertAddress() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(textAddress.text!) {
            (placemarks, error) in
           guard let placemarks = placemarks,
                 let location = placemarks.first?.location
            else {
                    print ("no location found")
                    return
                }
            print(location)
            self.mapThis(desitiationCor: location.coordinate)
            }
    }
    
    // sets location and gets updates render function for additional zoom
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print (locations)
        if let location = locations.first {
            manager.startUpdatingLocation()
             render (location)
            
        }
    }
 // render function sets the region and pin for orginal location
    func render (_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D (latitude: location.coordinate.latitude, longitude: location.coordinate.longitude )
        //span settings determine how much to zoom into the map - defined details
        let span = MKCoordinateSpan(latitudeDelta: 4.9, longitudeDelta: 4.9)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let pin = MKPointAnnotation ()
        
        pin.coordinate = coordinate
        map.addAnnotation(pin)
        map.setRegion(region, animated: true)
        
    }
    
    
    func mapThis(desitiationCor : CLLocationCoordinate2D) {
        
        let sourceCoordinate = (locationManager.location?.coordinate)!
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: desitiationCor)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
       
        let destinationRequest = MKDirections.Request()
        
        //start and end
        destinationRequest.source = sourceItem
        destinationRequest.destination = destinationItem
        
        // how travel
        destinationRequest.transportType = .automobile
        // one route = false multi = true
        destinationRequest.requestsAlternateRoutes = true
        
        // submit request to calculate directions
        let directions = MKDirections(request: destinationRequest)
        directions.calculate { (response, error) in
            // if there is a response make it the response else make error
            guard let response = response else {
                if let error = error {
                    print("something went wrong")
                }
                return
            }
            
            //we want the first respinse
            let route = response.routes[0]
            
            // adding overlay to routes
            self.map.addOverlay(route.polyline)
            self.map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            
            // setting endpoint pin
            let pin = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D (latitude: desitiationCor.latitude, longitude: desitiationCor.longitude )
            pin.coordinate = coordinate
            pin.title = "END POINT"
            self.map.addAnnotation(pin)
    }
    
}
    // Create a polyline overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let routeline = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        routeline.strokeColor = .green
        
        return routeline
       
    }

}
