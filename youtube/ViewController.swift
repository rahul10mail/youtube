//
//  ViewController.swift
//  youtube
//
//  Created by Rahul Kumar on 26/08/20.
//  Copyright © 2020 Rahul Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

