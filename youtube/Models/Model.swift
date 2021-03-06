//
//  Model.swift
//  youtube
//
//  Created by Rahul Kumar on 26/08/20.
//  Copyright © 2020 Rahul Kumar. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    var delegate: ModelDelegate?
    
    func getVideos() {
        // create url object
        let url = URL(string: K.API_URL)
        
        guard url != nil else {
            return
        }
        
        // create url session object
        let session = URLSession.shared
        
        // create dataTask
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
                dump(response)
                print(data!)
                print("success")
            } catch {
                print(error)
            }
            
            
        }
        
        task.resume()
    }
}
