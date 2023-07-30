//
//  NetworkManager.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 30.07.2023.
//

import UIKit

struct NetworkManager {
    static func request(for configoration: AppConfiguration) {
        let session = URLSession(configuration: .default)
        
        let url = URL(string: configoration.rawValue)
        
        let task = session.dataTask(with: url!) { data, responce, error in
          
            if let error{
                print(error.localizedDescription)
                return
            }
            
            let statusCode = (responce as! HTTPURLResponse).statusCode
            if statusCode != 200 {
                print("status code = \(statusCode)")
                return
            }
            
            if let allHeaderFields = (responce as! HTTPURLResponse).allHeaderFields as? [String: Any] {
                print(allHeaderFields)
            }
            
            guard let data else {
                print("No Data")
                return
            }
            
            do {
                if let answer = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let name = answer["name"],
                   let url = answer["url"]{
                    print("Name of object: \(name)")
                    print("Url: \(url)")
                }
            }catch{
                print("Error to take Data: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
    
}

