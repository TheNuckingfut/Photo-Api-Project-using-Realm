//
//  APIService.swift
//  first
//
//  Created by Sanjay, Vaishnavi on 28/02/23.
//

import Foundation

class APIService {
     init()
    {}
        func fetch(completed : @escaping([Photos])-> ())
        {
            let url = URL(string:"https://jsonplaceholder.typicode.com/photos")
            
            URLSession.shared.dataTask(with: url! ){
                (data ,response ,error) in
                
                if error == nil{
                    do{
                        
                        
                        let decoder = try JSONDecoder().decode([Photos].self, from: data!)
                        DispatchQueue.main.async {
                            completed(decoder)
                        }
                    }catch{
                        print("JSON Error")
                    }
                }
                
            }.resume()
            
        }
    }


    

