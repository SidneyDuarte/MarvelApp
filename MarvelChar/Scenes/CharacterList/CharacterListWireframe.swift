//
//  CharacterListWireframe.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterListWireframeProtocol {
    var presenter: CharacterListPresenterProtocol { get }
    var interactor: CharacterListInteractorProtocol { get set }
    var repository: RepositoryProtocol { get }
    var coreDataManager: CoreDataManagerProtocol { get }
    var router: CharacterListRouterProtocol { get set }
    init(viewController: CharacterListViewController)
}

class CharacterListWireframe: CharacterListWireframeProtocol {
    var interactor: CharacterListInteractorProtocol = CharacterListInteractor()
    var repository: RepositoryProtocol = Repository()
    var coreDataManager: CoreDataManagerProtocol = CoreDataManager()
    var router: CharacterListRouterProtocol = CharacterListRouter()
    var presenter: CharacterListPresenterProtocol = CharacterListPresenter()
    
    required init(viewController: CharacterListViewController) {
        interactor.coreDataManager = coreDataManager
        interactor.presenter = presenter
        interactor.repository = repository
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
