//
//  FavoriteCharactersWireFrame.swift
//  MarvelChar
//
//  Created by SidneySilva on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharactersWireFrameProtocol {
    var presenter: FavoriteCharactersPresenterProtocol { get }
    var interactor: FavoriteCharactersInteractorProtocol  { get }
    var coreDataManager: CoreDataManagerProtocol { get }
    var router: FavoriteCharactersRouter { get }
}

class FavoriteCharactersWireFrame: FavoriteCharactersWireFrameProtocol {
    var presenter: FavoriteCharactersPresenterProtocol = FavoriteCharactersPresenter()
    var interactor: FavoriteCharactersInteractorProtocol = FavoriteCharactersInteractor()
    var coreDataManager: CoreDataManagerProtocol = CoreDataManager()
    var router: FavoriteCharactersRouter = FavoriteCharactersRouter()
    
    init(viewController: FavoriteCharacterViewController) {
        interactor.presenter = presenter
        interactor.coreDataManager = coreDataManager
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
