//
//  DateConfig.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 30.07.2023.
//

import UIKit

struct DateConfig{
    
    static func dateConfig(complition: @escaping(_ title: String) -> Void){
        
        let session = URLSession(configuration: .default)
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/13")
        
        let task = session.dataTask(with: url!) { data, response, error in
            
            if let error{
                print(error)
                return
            }
            
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode != 200 {
                print("Error of statusCode: \(statusCode)")
                return
            }
            
            guard let data else {
                print("Errord of data")
                return
            }
            
            do{
                if let answer = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let title = answer["title"] {
                    complition(title as! String)
                }
            }catch {
                print("Error to take Data: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
    }
    
}
