//
//  CharacterDetailsViewControllerMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterDetailsViewControllerMock: CharacterDetailsTableViewControllerProtocol {
    var displayInfoIsCalled = false
    var displaySeriesIsCalled = false
    var displayComicsIsCalled = false
    var saveFromFavoritesIsCalled = false
    var removeFromFavoritesIsCalled = false
    var getErrorIsCalled = false
    
    func displayInfo(character: Result, imageUrl: URL?) {
        displayInfoIsCalled = true
    }
    
    func displaySeries() {
        displaySeriesIsCalled = true
    }
    
    func displayComics() {
        displayComicsIsCalled = true
    }
    
    func saveFromFavorites() {
        saveFromFavoritesIsCalled = true
    }
    
    func removeFromFavorites() {
        removeFromFavoritesIsCalled = true
    }
    
    func getError() {
        getErrorIsCalled = true
    }
}
