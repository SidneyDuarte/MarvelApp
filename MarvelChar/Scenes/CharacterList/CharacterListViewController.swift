//
//  CharacterListViewController.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterListViewControllerProtocol: class {
    func showCharacters()
    func showError(error: String)
}

class CharacterListViewController: UIViewController {
    var wireFrame: CharacterListWireframe?
    var loadingView: LoadingView?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        wireFrame = CharacterListWireframe(viewController: self)
        wireFrame?.interactor.fetchCharacter(offset: 0)
        configureLayout()
        flowLayout.configFlowLayoutSize(viewWidth: self.view.bounds.width)
    }
    
    func configureLayout() {
        configureLoadingView()
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "characterCell")
    }
    
    func configureLoadingView() {
        loadingView = LoadingView.instanceFromNib()
        loadingView?.frame = self.view.frame
        view.addSubview(loadingView ?? UIView())
    }
}

extension CharacterListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wireFrame?.interactor.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterListCollectionViewCell else { return UICollectionViewCell() }
        guard let character = wireFrame?.interactor.characters[indexPath.item] else {
            return cell
        }
        var isFavorite = false
        if let favorites = wireFrame?.interactor.favoritesCharacter.filter({ $0.id == character.id }) {
            isFavorite = favorites.count > 0 ? true : false
        }
        cell.setupCell(character: character, isFavorite: isFavorite)
        cell.setupImage(thumbnail: character.thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let total = wireFrame?.interactor.dataClass?.total ?? (wireFrame?.interactor.characters.count ?? 0)
        let target = (wireFrame?.interactor.characters.count ?? 1) - 1
        
        if target < total && target == indexPath.row {
            configureLoadingView()
            wireFrame?.interactor.fetchCharacter(offset: wireFrame?.interactor.characters.count ?? 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let character = wireFrame?.interactor.characters[indexPath.item] else { return }
        wireFrame?.routeToShowDetails(character: character)
    }
}

extension CharacterListViewController: CharacterListViewControllerProtocol {
    func showCharacters() {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.collectionView.reloadData()
        }
    }
    
    func showError(error: String) {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
        }
    }
}
