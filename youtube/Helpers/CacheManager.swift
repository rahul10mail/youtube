//
//  CacheManager.swift
//  youtube
//
//  Created by Rahul Kumar on 27/08/20.
//  Copyright © 2020 Rahul Kumar. All rights reserved.
//

import Foundation

class CacheManager {
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
