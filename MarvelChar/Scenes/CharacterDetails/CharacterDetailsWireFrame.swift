//
//  CharacterDetailsWireFrame.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterDetailsWireFrameProtocol {
    var presenter: CharacterDetailsPresenterProtocol { get }
    var interactor: CharacterDetailsInteractorProtocol { get set }
    var coreDataManager: CoreDataManagerProtocol { get }
    var repository: RepositoryProtocol { get }
}

class CharacterDetailsWireFrame: CharacterDetailsWireFrameProtocol {
    var presenter: CharacterDetailsPresenterProtocol = CharacterDetailsPresenter()
    var interactor: CharacterDetailsInteractorProtocol = CharacterDetailsInteractor()
    var coreDataManager: CoreDataManagerProtocol = CoreDataManager()
    var repository: RepositoryProtocol = Repository()
    
    init(viewController: CharacterDetailsTableViewController) {
        interactor.presenter = presenter
        interactor.coreDataManager = coreDataManager
        interactor.repository = repository
        presenter.viewController = viewController
    }
}
