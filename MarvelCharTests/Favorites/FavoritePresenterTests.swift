//
//  FavoritePresenterTests.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import XCTest
@testable import MarvelChar

class FavoritePresenterTests: XCTestCase {
    var sut: FavoriteCharactersPresenter!
    var spy: FavoriteViewControllerMock!
    
    override func setUp() {
        super.setUp()
        sut = FavoriteCharactersPresenter()
        spy = FavoriteViewControllerMock()
        sut.viewController = spy
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        spy = nil
    }
    
    func testShowCharacters() {
        sut.showCharacters()
        
        XCTAssertTrue(spy.showCharactersIsCalled)
    }

    func testEmptyState() {
        sut.emptyState(state: .noInternet)
        
        XCTAssertTrue(spy.emptyStateIsCalled)
    }

}
