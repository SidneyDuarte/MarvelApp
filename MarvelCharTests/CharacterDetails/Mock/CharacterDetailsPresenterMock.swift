//
//  CharacterDetailsPresenterMock.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterDetailsPresenterMock: CharacterDetailsPresenterProtocol {
    var viewController: CharacterDetailsTableViewControllerProtocol?
    var displayInfoIsCalled = false
    var displaySeriesIsCalled = false
    var displayComicsIsCalled = false
    var showErrorIsCalled = false
    var saveFromFavoriteIsCalled = false
    var revomeFromFavoriteIsCalled = false
    
    func displayInfo(character: Result) {
        displayInfoIsCalled = true
    }
    
    func displaySeries() {
        displaySeriesIsCalled = true
    }
    
    func displayComics() {
       displayComicsIsCalled = true
    }
    
    func showError() {
       showErrorIsCalled = true
    }
    
    func saveFromFavorite() {
        saveFromFavoriteIsCalled = true
    }
    
    func revomeFromFavorite() {
        revomeFromFavoriteIsCalled = true
    }
}
