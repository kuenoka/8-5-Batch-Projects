//
//  ViewController.swift
//  MapProject
//
//  Created by MCS on 9/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

  let locationManager = CLLocationManager()
 
  @IBOutlet weak var theMapView: MKMapView!
  
  var currentLocations: CLLocation? {
    didSet {
      guard let unwrappedLocation = currentLocations else { return }
      theMapView.setCenter(unwrappedLocation.coordinate, animated: true)
      let mapPoint = MKMapPoint(unwrappedLocation.coordinate)
      let mapSize = MKMapSize(width: 900000, height: 900000)
      let mapRect = MKMapRect(origin: mapPoint, size: mapSize)
      theMapView.setVisibleMapRect(mapRect, animated: true)
      let annotation = MKPointAnnotation()
      annotation.coordinate = unwrappedLocation.coordinate
      theMapView.addAnnotation(annotation)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    //locationManager.requestLocation()
    locationManager.startUpdatingLocation()
  }
}

extension ViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print(locations)
    currentLocations = locations.first
    CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
      print(placemarks)
      print(error?.localizedDescription)
    }
  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
}
