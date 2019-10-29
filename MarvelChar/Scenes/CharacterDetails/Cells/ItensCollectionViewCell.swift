//
//  ComicsCollectionViewCell.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class ItensCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    func setupImage(thumbnail: Thumbnail?) {
        let url = URL(string: "\(thumbnail?.path ?? "").\(thumbnail?.fileExtension ?? "")")
        itemImage.getImageUsingNSCache(imageUrl: url)
    }
}
