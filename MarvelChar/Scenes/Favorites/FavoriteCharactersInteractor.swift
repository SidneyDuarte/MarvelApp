//
//  FavoriteCharactersInteractor.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharactersInteractorProtocol {
    func showCharacters()
}

class FavoriteCharactersInteractor: NSObject {
    var characters = [Result]()
    var coreDataManager: CoreDataManager?
    var presenter: FavoriteCharactersPresenterProtocol?
    
    init(coreDataManager: CoreDataManager) {
        super.init()
        self.coreDataManager = coreDataManager
    }
}

extension FavoriteCharactersInteractor: FavoriteCharactersInteractorProtocol {
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
