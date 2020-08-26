//
//  Model.swift
//  youtube
//
//  Created by Rahul Kumar on 26/08/20.
//  Copyright © 2020 Rahul Kumar. All rights reserved.
//

import Foundation

class Model {
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
            
            print(data!)
            print("success")
        }
        
        task.resume()
    }
}
