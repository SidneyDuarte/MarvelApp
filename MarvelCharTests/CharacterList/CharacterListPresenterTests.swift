//
//  CharacterListPresenterTests.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import XCTest
@testable import MarvelChar

class CharacterListPresenterTests: XCTestCase {
    var sut: CharacterListPresenter!
    var spy: CharacterListViewControllerMock!
    
    override func setUp() {
        super.setUp()
        sut = CharacterListPresenter()
        spy = CharacterListViewControllerMock()
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
    
    func testShowError() {
        sut.showError(state: .noInternet)
        XCTAssertTrue(spy.showErrorIsCalled)
    }

}
