//
//  CharacterDetailsInteractorTests.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import XCTest
@testable import MarvelChar

class CharacterDetailsInteractorTests: XCTestCase {
    var sut: CharacterDetailsInteractor!
    var coreDataMock: CoreDataManagerMock!
    var repositorySuccess: RepositorySuccessMock!
    var repositoryFailure: RepositoryFailureMock!
    var spy: CharacterDetailsPresenterMock!
    
    override func setUp() {
        super.setUp()
        sut = CharacterDetailsInteractor()
        spy = CharacterDetailsPresenterMock()
        repositorySuccess = RepositorySuccessMock()
        repositoryFailure = RepositoryFailureMock()
        coreDataMock = CoreDataManagerMock()
        sut.coreDataManager = coreDataMock
        sut.presenter = spy
        sut.character = ResponseMock.resultMock()
    }

    override func tearDown() {
        sut = nil
        spy = nil
        repositorySuccess = nil
        repositoryFailure = nil
        coreDataMock = nil
    }

    func testGetInfo() {
        sut.getInfo()
        
        XCTAssertTrue(spy.displayInfoIsCalled)
    }
    
    func testLoadSeriesSuccess() {
        sut.repository = repositorySuccess
        
        sut.loadSeries(characterId: 1234)
        XCTAssertTrue(spy.displaySeriesIsCalled)
    }
    
    func testLoadSeriesFailure() {
        sut.repository = repositoryFailure
        
        sut.loadSeries(characterId: 1234)
        XCTAssertTrue(spy.showErrorIsCalled)
    }
    
    func testLoadComicsSuccess() {
        sut.repository = repositorySuccess
        
        sut.loadComics(characterId: 1234)
        XCTAssertTrue(spy.displayComicsIsCalled)
    }
    
    func testLoadComicsFailure() {
        sut.repository = repositoryFailure
        
        sut.loadComics(characterId: 1234)
        XCTAssertTrue(spy.showErrorIsCalled)
    }
    
    func testSetupFavoriteTrue() {
        sut.character = ResponseMock.resultMock()
        sut.setupFavorite(isFavorite: true)
        
        XCTAssertTrue(spy.revomeFromFavoriteIsCalled)
    }
    
    func testSetupFavoriteFalse() {
        sut.setupFavorite(isFavorite: false)
        
        XCTAssertTrue(spy.saveFromFavoriteIsCalled)
    }
}
