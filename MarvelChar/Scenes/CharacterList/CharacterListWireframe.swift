//
//  CharacterListWireframe.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class CharacterListWireframe: NSObject {
    let presenter = CharacterListPresenter()
    let interactor = CharacterListInteractor()
    let repository = Repository()
    let coreDataManager = CoreDataManager()
    let router = CharacterListRouter()
    var viewController: CharacterListViewController?
    
    init(viewController: CharacterListViewController) {
        self.viewController = viewController
        interactor.coreDataManager = coreDataManager
        interactor.presenter = presenter
        interactor.repository = repository
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
