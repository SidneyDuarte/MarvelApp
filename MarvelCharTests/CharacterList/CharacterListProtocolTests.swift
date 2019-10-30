//
//  CharacterListProtocolTests.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import XCTest
@testable import MarvelChar

class CharacterListProtocolTests: XCTestCase {
    var sut: CharacterListInteractor!
    var repositorySuccess: RepositorySuccessMock!
    var repositoryFailure: RepositoryFailureMock!
    var coreDataMock: CoreDataManagerMock!
    var spy: CharacterListPresenterMock!

    override func setUp() {
        super.setUp()
        sut = CharacterListInteractor()
        repositorySuccess = RepositorySuccessMock()
        repositoryFailure = RepositoryFailureMock()
        coreDataMock = CoreDataManagerMock()
        spy = CharacterListPresenterMock()
        sut.presenter = spy
        sut.coreDataManager = coreDataMock
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        repositorySuccess = nil
        repositoryFailure = nil
        spy = nil
    }
    
    func testFetchCharacter() {
        sut.repository = repositorySuccess
        sut.fetchCharacter(offset: 0)
        
        XCTAssertTrue(spy.showCharacterIsCalled)
    }
    
    func testFetchCharacterFailure() {
        sut.repository = repositoryFailure
        sut.fetchCharacter(offset: 0)
        
        XCTAssertTrue(spy.showErrorIsCalled)
    }
    
    func testRefresh() {
        sut.repository = repositorySuccess
        sut.refresh()
        
        XCTAssertTrue(spy.showCharacterIsCalled)
    }
    
    func testRefreshFailure() {
        sut.repository = repositoryFailure
        sut.refresh()
        
        XCTAssertTrue(spy.showErrorIsCalled)
    }
    
    func testFetchFavoriteCharacter() {
        sut.fetchFavoriteCharacter()
        XCTAssertEqual(sut.favoritesCharacter.count, 1)
    }
    
    func testFetchCharacterByName() {
        sut.repository = repositorySuccess
        sut.fetchCharacterByName(name: "OMiranha")
        
        XCTAssertTrue(spy.showCharacterIsCalled)
    }
    
    func testFetchCharacterByNameFailure() {
        sut.repository = repositoryFailure
        sut.fetchCharacterByName(name: "OMiranha")
        
        XCTAssertTrue(spy.showErrorIsCalled)
    }
}
