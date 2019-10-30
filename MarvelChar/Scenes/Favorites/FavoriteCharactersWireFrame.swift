//
//  FavoriteCharactersWireFrame.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class FavoriteCharactersWireFrame: NSObject {
    var viewController: FavoriteCharacterViewController?
    let presenter = FavoriteCharactersPresenter()
    let interactor: FavoriteCharactersInteractor!
    let coreDataManager = CoreDataManager()
    let router = FavoriteCharactersRouter()
    
    init(viewController: FavoriteCharacterViewController) {
        self.viewController = viewController
        interactor = FavoriteCharactersInteractor(coreDataManager: coreDataManager)
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
