//
//  CharacterDetailsPresenterTests.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import XCTest
@testable import MarvelChar

class CharacterDetailsPresenterTests: XCTestCase {
    var sut: CharacterDetailsPresenter!
    var spy: CharacterDetailsViewControllerMock!
    
    override func setUp() {
        super.setUp()
        sut = CharacterDetailsPresenter()
        spy = CharacterDetailsViewControllerMock()
        sut.viewController = spy
    }

    override func tearDown() {
        sut = nil
        spy = nil
    }
    
    
    func testDisplayInfo() {
        sut.displayInfo(character: ResponseMock.resultMock())
        
        XCTAssertTrue(spy.displayInfoIsCalled)
    }
    
    func testDisplaySeries() {
        sut.displaySeries()
        
        XCTAssertTrue(spy.displaySeriesIsCalled)
    }
    
    func testDisplayComics() {
        sut.displayComics()
        
        XCTAssertTrue(spy.displayComicsIsCalled)
    }
    
    func testSaveFromFavorite() {
        sut.saveFromFavorite()
        
        XCTAssertTrue(spy.saveFromFavoritesIsCalled)
    }
    
    func testRevomeFromFavorite() {
        sut.revomeFromFavorite()
        
        XCTAssertTrue(spy.removeFromFavoritesIsCalled)
    }
    
    func testShowError() {
        sut.showError()
        
        XCTAssertTrue(spy.getErrorIsCalled)
    }
}
