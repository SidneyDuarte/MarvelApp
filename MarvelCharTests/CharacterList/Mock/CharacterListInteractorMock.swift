//
//  CharacterListInteractorMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterListInteractorMock: CharacterListInteractorProtocol {
    var presenter: CharacterListPresenterProtocol?
    var repository: RepositoryProtocol?
    var coreDataManager: CoreDataManagerProtocol?
    var dataClass: DataClass?
    var characters: [Result] = []
    var favoritesCharacter: [Result] = []
    var fetchIsCalled = false
    var refreshIsCalled = false
    var fetchFavoriteIsCalled = false
    var fetchByNameIsCalled = false
    
    func fetchCharacter(offset: Int) {
        characters = [ResponseMock.resultMock()]
        fetchIsCalled = true
    }
    
    func refresh() {
        characters = [ResponseMock.resultMock()]
        refreshIsCalled = true
    }
    
    func fetchFavoriteCharacter() {
        favoritesCharacter = [ResponseMock.resultMock()]
        fetchFavoriteIsCalled = true
    }
    
    func fetchCharacterByName(name: String) {
        characters = [ResponseMock.resultMock()]
        fetchByNameIsCalled = true
    }
}
