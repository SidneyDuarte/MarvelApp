//
//  CharacterDetailsInteractorMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterDetailsInteractorMock: CharacterDetailsInteractorProtocol {
    var presenter: CharacterDetailsPresenterProtocol?
    var repository: RepositoryProtocol?
    var coreDataManager: CoreDataManagerProtocol?
    var comics: [Result] = []
    var series: [Result] = []
    var character: Result?
    var numberOfSeries: Int = 0
    var numberOfComics: Int = 0
    var getInfoIsCalled = false
    var loadSeriesIsCalled = false
    var loadComicsIsCalled = false
    var setupFavoriteIsCalled = false
    
    func getInfo() {
        getInfoIsCalled = true
    }
    
    func loadSeries(characterId: Int) {
        loadSeriesIsCalled = true
    }
    
    func loadComics(characterId: Int) {
        loadComicsIsCalled = true
    }
    
    func setupFavorite(isFavorite: Bool) {
        setupFavoriteIsCalled = true
    }
    

}
