//
//  CharacterDetailsWireFrame.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class CharacterDetailsWireFrame: NSObject {
    var viewController: CharacterDetailsTableViewController?
    let presenter = CharacterDetailsPresenter()
    let interactor = CharacterDetailsInteractor()
    let repository = Repository()
    
    init(viewController: CharacterDetailsTableViewController) {
        self.viewController = viewController
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.repository = repository
        presenter.viewController = viewController
    }
}
