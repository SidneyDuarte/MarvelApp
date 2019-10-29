//
//  FavoriteCharacterViewController.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharacterViewControllerProtocol: class {
    func showCharacters()
}

class FavoriteCharacterViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var wireFrame: FavoriteCharactersWireFrame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        flowLayout.configFlowLayoutSize(viewWidth: self.view.bounds.width)
        wireFrame = FavoriteCharactersWireFrame(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wireFrame?.interactor.showCharacters()
    }
    
    func configureLayout() {
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "characterCell")
    }
}

extension FavoriteCharacterViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wireFrame?.interactor.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterListCollectionViewCell else { return UICollectionViewCell() }
        guard let character = wireFrame?.interactor.characters[indexPath.item] else {
            return cell
        }
        cell.setupCell(character: character, isFavorite: true)
        cell.setupImage(thumbnail: character.thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let character = wireFrame?.interactor.characters[indexPath.item] else { return }
        wireFrame?.routeToShowDetails(character: character)
    }
}

extension FavoriteCharacterViewController: FavoriteCharacterViewControllerProtocol {
    func showCharacters() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


