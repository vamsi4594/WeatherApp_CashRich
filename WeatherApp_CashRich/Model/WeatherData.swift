//
//  WeatherData.swift
//  WeatherApp_CashRich
//
//  Created by Mac on 09/09/20.
//  Copyright © 2020 Vamsi KrishnaT hanikanti. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable{
    let description: String
    let id: Int
}
