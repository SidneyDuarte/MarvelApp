//
//  FavoriteCharacterViewController.swift
//  MarvelChar
//
//  Created by SidneySilva on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharacterViewControllerProtocol: class {
    func showCharacters()
    func emptyState(state: State)
}

class FavoriteCharacterViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var wireFrame: FavoriteCharactersWireFrameProtocol?
    
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
        wireFrame?.router.routeToShowDetails(character: character)
    }
}

extension FavoriteCharacterViewController: FavoriteCharacterViewControllerProtocol {
    func showCharacters() {
        DispatchQueue.main.async {
            self.collectionView.backgroundView = nil
            self.collectionView.reloadData()
        }
    }
    
    func emptyState(state: State) {
        self.collectionView.reloadData()
        self.collectionView.backgroundView = EmptyStateView.instanceFromNib(state: state)
    }
}


