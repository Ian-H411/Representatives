//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Ian Hall on 8/14/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation

class RepresentativeController {

    
// final appendage to url   state="\(statename)"  after that we need &output=json
//http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA
    
    let baseUrl = "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
    
    static func searchRepresentatives(state: String, completion: @escaping ([Representative])-> Void){
        
        let dictionary = ["state":state, "output" : "json"]
        let urlQueryItems = [URLQueryItem(name: "state", value: dictionary["state"] ), URLQueryItem(name: "output", value: dictionary["output"])]
        
        
        
        var componentURL =  URLComponents(string:"http://whoismyrepresentative.com/getall_reps_bystate.php")
        componentURL?.queryItems = urlQueryItems
        guard let finalURl  = componentURL?.url else {completion([]); return}
        print(finalURl.absoluteString)
        let request = URLRequest(url: finalURl)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error { completion([]); print(error); return }
            
            guard let data = data else {completion([]); return}
            guard let incorect =  String(data: data, encoding: .utf8) else {completion([]); return}
            guard let correctData = incorect.data(using: .utf8) else {completion([]); return}
            do{
                let decoder = JSONDecoder()
                let representaives = try decoder.decode([String:[Representative]].self, from: correctData)
                guard let representativeArray = representaives["results"] else {completion([]); return}
                print(representativeArray)
                completion(representativeArray)
                return
            } catch{
                print("error with retrieving data" + error.localizedDescription)
                completion([])
                return
            }
        }.resume()
    }
}
