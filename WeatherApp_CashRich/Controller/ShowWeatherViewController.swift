//
//  ShowWeatherViewController.swift
//  WeatherApp_CashRich
//
//  Created by Mac on 09/09/20.
//  Copyright © 2020 Vamsi KrishnaT hanikanti. All rights reserved.
//

import UIKit
import CoreLocation

class ShowWeatherViewController: UIViewController {

    @IBOutlet weak var searchLocationBtn: UIButton!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weartherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchLocationBtn.layer.cornerRadius = 20
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weartherManager.delegate = self
    }
    
}

extension ShowWeatherViewController: WeatherManagerDelegate
{
   func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
       // print(weather.temperature)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }

    }
    func didFailWithError(error: Error){
        print(error)
    }
}

extension ShowWeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func searchLocationClicked(_ sender:UIButton) {
        locationManager.requestLocation()
        print("vsdfhbvhsdbvhdsbvhdsbvdvdsvdvdfsv")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last
        {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weartherManager.fetchWeather(latitude: lat , longitude : lon)
               
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}
