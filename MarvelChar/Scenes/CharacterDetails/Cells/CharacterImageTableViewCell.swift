//
//  CharacterImageTableViewCell.swift
//  MarvelChar
//
//  Created by SidneySilva on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class CharacterImageTableViewCell: UITableViewCell {
    @IBOutlet weak var characterImage: UIImageView!

    func setupImage(thumbnail: Thumbnail?) {
        let url = URL(string: "\(thumbnail?.path ?? "").\(thumbnail?.fileExtension ?? "")")
        characterImage.getImageUsingNSCache(imageUrl: url)
    }
}
