//
//  CharacterListCollectionViewCell.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class CharacterListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    var interactor: CharacterListInteractorProtocol?
    
    func setupCell(character: Result) {
        characterName.text = character.name
        
    }
    
    func setupImage(thumbnail: Thumbnail?) {
        let url = URL(string: "\(thumbnail?.path ?? "").\(thumbnail?.fileExtension ?? "")")
        characterImage.getImageUsingNSCache(imageUrl: url)
    }
    
    @IBAction func didClickFavorite(_ sender: Any) {
        
    }
}
