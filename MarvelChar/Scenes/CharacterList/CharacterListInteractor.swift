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
}

class CharacterListInteractor: CharacterListInteractorProtocol {
    var presenter: CharacterListPresenterProtocol?
    var repository: Repository?
    
    func fetchCharacter(offset: Int) {
        let request = MarvelCharacter.Request(orderBy: "name", limit: 20, offset: offset, endpoint: "characters", append: "")
        repository?.getResponse(request: request, success: { (response) in
            self.presenter?.showCharacters(dataClass: response.response?.data)
        }, failure: { (error) in
            self.presenter?.showError(error: error)
        })
    }
}
