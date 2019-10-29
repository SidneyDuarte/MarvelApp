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
    var interactor: CharacterListInteractorProtocol?
    
    func setupCell(character: Result, isFavorite: Bool) {
        self.isFavorite = isFavorite
        self.character = character
        characterName.text = character.name
        let imageName = isFavorite ? "favoriteSelect" : "favoriteDeselect"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
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
        let imageName = isFavorite ? "favoriteSelect" : "favoriteDeselect"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImage.image = UIImage(named: "placeholder")
        characterName.text = "Stan Lee"
    }
}
