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
    func showError(state: State)
}

class CharacterListViewController: UIViewController {
    var wireFrame: CharacterListWireframe?
    var loadingView: LoadingView?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        wireFrame = CharacterListWireframe(viewController: self)
        flowLayout.configFlowLayoutSize(viewWidth: self.view.bounds.width)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureLayout()
        wireFrame?.interactor.characters.removeAll()
        collectionView.reloadData()
        wireFrame?.interactor.fetchFavoriteCharacter()
        wireFrame?.interactor.fetchCharacter(offset: 0)
    }
    
    func configureLayout() {
        configureLoadingView()
        collectionView.backgroundView = nil
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "characterCell")
    }
    
    @objc func refresh() {
        wireFrame?.interactor.refresh()
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
        wireFrame?.interactor.characters[indexPath.item].isFavorite = isFavorite
        cell.setupCell(character: character, isFavorite: isFavorite)
        cell.setupImage(thumbnail: character.thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let total = wireFrame?.interactor.dataClass?.total ?? 0
        let target = wireFrame?.interactor.characters.count ?? 0
        
        if target < total && target == (indexPath.item + 1) {
            configureLoadingView()
            wireFrame?.interactor.fetchCharacter(offset: wireFrame?.interactor.characters.count ?? 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let character = wireFrame?.interactor.characters[indexPath.item] else { return }
        wireFrame?.router.routeToShowDetails(character: character)
    }
}

extension CharacterListViewController: CharacterListViewControllerProtocol {
    func showCharacters() {
        DispatchQueue.main.async {
            self.collectionView.backgroundView = nil
            self.collectionView.refreshControl?.endRefreshing()
            self.loadingView?.removeFromSuperview()
            self.collectionView.reloadData()
        }
    }
    
    func showError(state: State) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.backgroundView = EmptyStateView.instanceFromNib(state: state) ?? UIView()
            self.collectionView.refreshControl?.endRefreshing()
            self.loadingView?.removeFromSuperview()
        }
    }
}

extension CharacterListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchBar.text else { return }
        guard !name.isEmpty else {
            wireFrame?.interactor.refresh()
            return
        }
        wireFrame?.interactor.fetchCharacterByName(name: name)
    }
}
