//
//  ViewController.swift
//  WeatherApp_CashRich
//
//  Created by Mac on 09/09/20.
//  Copyright © 2020 Vamsi KrishnaT hanikanti. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        self.view = mapView
        mapView.mapType = .satellite
        //mapView.isIndoorEnabled = false
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = false
        mapView.settings.zoomGestures = false
        mapView.delegate = self
        // The myLocation attribute of the mapView may be null
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
          print("User's location is unknown")
        }
        let mapInsets = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 300.0)
        mapView.padding = mapInsets
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
      print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }


}

