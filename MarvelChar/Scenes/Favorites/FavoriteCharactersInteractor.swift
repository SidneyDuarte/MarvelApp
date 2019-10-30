//
//  FavoriteCharactersInteractor.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharactersInteractorProtocol {
    var characters: [Result] { get }
    var coreDataManager: CoreDataManagerProtocol?  { get set }
    var presenter: FavoriteCharactersPresenterProtocol?  { get set }
    func showCharacters()
}

class FavoriteCharactersInteractor: FavoriteCharactersInteractorProtocol {
    var characters = [Result]()
    var coreDataManager: CoreDataManagerProtocol?
    var presenter: FavoriteCharactersPresenterProtocol?
    
    func showCharacters() {
        guard let characters = coreDataManager?.retrieveCharacters(), characters.count > 0 else {
            self.characters.removeAll()
            presenter?.emptyState(state: .noResult)
            return
        }
        self.characters = characters
        self.presenter?.showCharacters()
    }
}
