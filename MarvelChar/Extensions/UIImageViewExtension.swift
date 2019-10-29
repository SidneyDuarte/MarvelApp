//
//  UIImageViewExtension.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func getImageUsingNSCache(imageUrl: URL?){
        guard let url = imageUrl else { return }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString? ?? "" as NSString) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard error == nil, let imageData = data else {
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                guard let image = UIImage(data: imageData) else { return }
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                self.image = image
            })
            
        }).resume()
    }
}
