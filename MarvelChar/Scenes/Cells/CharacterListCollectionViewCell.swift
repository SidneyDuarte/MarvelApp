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
    @IBOutlet weak var favoriteButton: UIButton!
    var character: Result?
    var isFavorite = false
    
    func setupCell(character: Result, isFavorite: Bool) {
        self.isFavorite = isFavorite
        self.character = character
        characterName.text = character.name
        let image = isFavorite ? #imageLiteral(resourceName: "favoriteSelect") : #imageLiteral(resourceName: "favoriteDeselect")
        favoriteButton.setImage(image, for: .normal)
    }
    
    func setupImage(thumbnail: Thumbnail?) {
        let url = URL(string: "\(thumbnail?.path ?? "").\(thumbnail?.fileExtension ?? "")")
        characterImage.getImageUsingNSCache(imageUrl: url)
    }

    @IBAction func didClickFavorite(_ sender: Any) {
        guard let character = self.character else { return }
        let coreData = CoreDataManager()
        if isFavorite {
            coreData.deleteCharacter(id: character.id ?? 0)
        } else {
            coreData.saveCharacter(character: character)
        }
        isFavorite = !isFavorite
        let image = isFavorite ? #imageLiteral(resourceName: "favoriteSelect") : #imageLiteral(resourceName: "favoriteDeselect")
        favoriteButton.setImage(image, for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImage.image = #imageLiteral(resourceName: "placeholder")
        characterName.text = "Stan Lee"
    }
}
