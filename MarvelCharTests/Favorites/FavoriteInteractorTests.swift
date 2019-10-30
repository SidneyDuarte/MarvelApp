//
//  FavoriteInteractorTests.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import XCTest
@testable import MarvelChar

class FavoriteInteractorTests: XCTestCase {
    var sut: FavoriteCharactersInteractor!
    var coreDataMockSuccess: CoreDataManagerMock!
    var coreDataMockFailure: CoreDataFailureMock!
    var spy: FavoritePresenterMock!
    
    override func setUp() {
        super.setUp()
        sut = FavoriteCharactersInteractor()
        spy = FavoritePresenterMock()
        coreDataMockSuccess = CoreDataManagerMock()
        coreDataMockFailure = CoreDataFailureMock()
        sut.presenter = spy
    }

    override func tearDown() {
        sut = nil
        spy = nil
        coreDataMockSuccess = nil
        coreDataMockFailure = nil
    }
    
    func testShowCharactersSuccess() {
        sut.coreDataManager = coreDataMockSuccess
        sut.showCharacters()
        
        XCTAssertTrue(spy.showCharactersIsCalled)
    }
    
    func testShowCharactersFailure() {
        sut.coreDataManager = coreDataMockFailure
        sut.showCharacters()
        
        XCTAssertTrue(spy.emptyStateIsCalled)
    }
}
