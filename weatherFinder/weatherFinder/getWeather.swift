//
//  getWeather.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 25/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
class getTheWeather{
    
    var kelvin: Double = 0.0
    var description: String = "None"
    
struct weatherDesc: Decodable {
    
    let weather: [Weather]
    let main: Main
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
}

    func getWeather(city: Int)->weatherDesc{
    

    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=\(city)&appid=060305de4435694d756c92df5a70b07c") //API key at the end
        var temp = weatherDesc(weather: [Weather.init(description: "None")], main: Main.init(temp: 0.00))
    let task = URLSession.shared.dataTask(with: url!) {(data,response, error) in
        guard let data = data else{return}
        if error != nil{
            print(error!)
        }else{
           
                do{

                    let jsonResult = try JSONDecoder().decode(weatherDesc.self, from: data)
                    temp = jsonResult

                }catch{
                    print("Json processing failed")
                }
            
        }
    }
    task.resume()
    return temp
}
    
    func convertFromKelvinToCelsius(kelvin: Double) -> Double {
        return (kelvin - 273.15)
    }
    
    

}
