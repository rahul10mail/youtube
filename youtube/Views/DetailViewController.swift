//
//  DetailViewController.swift
//  youtube
//
//  Created by Rahul Kumar on 27/08/20.
//  Copyright © 2020 Rahul Kumar. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var video:Video?
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else {
            return
        }
        
        let embedUrl = K.YT_EMBED_URL + video!.videoId
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        textView.text = video!.description
    }
}
