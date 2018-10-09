//
//  getWeather.swift
//  weatherFinder
//
//  Created by Nils-erik Engen on 25/09/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
class getTheWeather{
    
    
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

    func getWeather(city: Int, _ completion: @escaping ([Any]) -> ()) -> [Any] {

    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=\(city)&appid=060305de4435694d756c92df5a70b07c")
    var temp = [Any]()
    let task = URLSession.shared.dataTask(with: url!) {(data,response, error) in
        guard let data = data else{return}
        print(data)
        if error != nil{
            print(error!)
        }else{
            if response != nil{
                do{
                    let jsonResult = try JSONDecoder().decode(weatherDesc.self, from: data)
                    temp.append(jsonResult.main.temp)
                    for i in jsonResult.weather{
                        temp.append(i.description)
                    }
                    completion(temp)
                }catch{
                    print("Json processing failed")
                }
            }
        }
    }
    task.resume()
    return temp
}
    
    func convertFromKelvinToCelsius(kelvin: Double) -> String {
        let res = kelvin - 273.15
        return String(round(res))
    }
    
    func makeWeatherDesc()-> weatherDesc{
        var temp = weatherDesc(weather: [Weather.init(description: "None")], main: Main.init(temp: 0.00))
        
        return temp
    }
    

}
