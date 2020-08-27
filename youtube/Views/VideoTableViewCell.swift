//
//  VideoTableViewCell.swift
//  youtube
//
//  Created by Rahul Kumar on 27/08/20.
//  Copyright © 2020 Rahul Kumar. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        self.titleLabel.text = video?.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check Cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download thumbnail
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                CacheManager.setVideoCache(url!.absoluteString, data)
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
            }
            
            let image = UIImage(data: data!)
            
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
        }
        task.resume()
        
       
    }
}
