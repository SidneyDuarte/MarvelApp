//
//  CharacterListInteractor.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterListInteractorProtocol {
    func fetchCharacter(offset: Int)
    func fetchFavoriteCharacter()
}

class CharacterListInteractor: NSObject {
    var presenter: CharacterListPresenterProtocol?
    var repository: Repository?
    var coreDataManager: CoreDataManager?
    var dataClass: DataClass?
    var characters = [Result]()
    var favoritesCharacter = [Result]()
}

extension CharacterListInteractor: CharacterListInteractorProtocol {
    func fetchCharacter(offset: Int) {
        let request = MarvelCharacter.Request(orderBy: "name", limit: 20, offset: offset, endpoint: "characters", append: "")
        repository?.getResponse(request: request, success: { (response) in
            guard let chars = response.response?.data?.results else {
                self.presenter?.showError(error: "nenhum personagem encontrado")
                return
            }
            self.dataClass = response.response?.data
            self.characters.append(contentsOf: chars)
            self.presenter?.showCharacters()
        }, failure: { (error) in
            self.presenter?.showError(error: error)
        })
    }
    
    func fetchFavoriteCharacter() {
        guard let characters = coreDataManager?.retrieveCharacters() else { return }
        favoritesCharacter = characters
    }
}
