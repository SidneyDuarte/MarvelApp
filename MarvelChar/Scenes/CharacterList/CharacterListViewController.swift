//
//  CharacterListViewController.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterListViewControllerProtocol: class {
    func showCharacters(dataClass: DataClass?)
    func showError(error: String)
}

class CharacterListViewController: UIViewController {
    var interactor: CharacterListInteractorProtocol?
    var wireFrame: CharacterListWireframe?
    var dataClass: DataClass?
    var characters = [Result]()
    var loadingView: LoadingView?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CharacterListWireframe.setup(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCharacter(offset: 0)
        configureLoadingView()
        flowLayout.configFlowLayoutSize(viewWidth: self.view.bounds.width)
        
    }
    
    func configureLoadingView() {
        loadingView = LoadingView.instanceFromNib()
        loadingView?.frame = self.view.frame
        view.addSubview(loadingView ?? UIView())
    }
}

extension CharacterListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterListCollectionViewCell else { return UICollectionViewCell() }
        let character = characters[indexPath.item]
        cell.setupCell(character: character)
        cell.setupImage(thumbnail: character.thumbnail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let total = dataClass?.total ?? characters.count
        let target = characters.count - 1
        
        if target < total && target == indexPath.row {
            configureLoadingView()
            interactor?.fetchCharacter(offset: characters.count)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.item]
        wireFrame?.routeToShowDetails(character: character)
    }
}

extension CharacterListViewController: CharacterListViewControllerProtocol {
    func showCharacters(dataClass: DataClass?) {
        self.dataClass = dataClass
        guard let charactersArray = dataClass?.results else { return }
        self.characters.append(contentsOf: charactersArray)
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.collectionView.reloadData()
        }
    }
    
    func showError(error: String) {
        
    }
}
