//
//  CharacterListWireFrameMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterListWireFrameMock: CharacterListWireframeProtocol {
    var presenter: CharacterListPresenterProtocol = CharacterListPresenterMock()
    var interactor: CharacterListInteractorProtocol = CharacterListInteractorMock()
    var repository: RepositoryProtocol = RepositorySuccessMock()
    var coreDataManager: CoreDataManagerProtocol = CoreDataManager()
    var router: CharacterListRouterProtocol = CharacterListRouter()
    
    let presenterMock = CharacterListPresenterMock()
    let interactorMock = CharacterListInteractorMock()
    let repositoryMock = RepositorySuccessMock()
    let coreDataManagerMock = CoreDataManager()
    let routerMock = CharacterListRouter()
    
    required init(viewController: CharacterListViewController) {
        interactorMock.coreDataManager = coreDataManagerMock
        interactorMock.presenter = presenterMock
        interactorMock.repository = repositoryMock
        presenterMock.viewController = viewController
        routerMock.viewController = viewController
    }
}
