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
    func refresh()
    func fetchFavoriteCharacter()
    func fetchCharacterByName(name: String)
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
                self.presenter?.showError(state: .noResult)
                return
            }
            self.dataClass = response.response?.data
            self.characters.append(contentsOf: chars)
            self.presenter?.showCharacters()
        }, failure: { (state) in
            self.characters.removeAll()
            self.presenter?.showError(state: state)
        })
    }
    
    func refresh() {
        let request = MarvelCharacter.Request(orderBy: "name", limit: 20, offset: 0, endpoint: "characters", append: "")
        repository?.getResponse(request: request, success: { (response) in
            guard let chars = response.response?.data?.results,
                  chars.count > 0 else {
                    self.presenter?.showError(state: .noResult)
                return
            }
            self.dataClass = response.response?.data
            self.characters = chars
            self.presenter?.showCharacters()
        }, failure: { (state) in
            self.characters.removeAll()
            self.presenter?.showError(state: state)
        })
    }
    
    func fetchCharacterByName(name: String) {
        let request = MarvelCharacter.Request(orderBy: "name", limit: 20, offset: 0, endpoint: "characters", append: "&nameStartsWith=\(name)")
        repository?.getResponse(request: request, success: { (response) in
            guard let characters = response.response?.data?.results,
                  characters.count > 0 else {
                self.characters.removeAll()
                    self.presenter?.showError(state: .wrongName)
                return
            }
            self.dataClass = response.response?.data
            self.characters = characters
            self.presenter?.showCharacters()
        }, failure: { (state) in
            self.presenter?.showError(state: state)
        })
    }
    
    func fetchFavoriteCharacter() {
        guard let characters = coreDataManager?.retrieveCharacters() else { return }
        favoritesCharacter = characters
    }
}
