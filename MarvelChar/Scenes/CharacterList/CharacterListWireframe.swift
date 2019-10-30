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
    var viewController: CharacterListViewController?
    
    init(viewController: CharacterListViewController) {
        self.viewController = viewController
        interactor.coreDataManager = coreDataManager
        interactor.presenter = presenter
        interactor.repository = repository
        presenter.viewController = viewController
    }

    func routeToShowDetails(character: Result) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "CharacterDetailsTableViewController") as? CharacterDetailsTableViewController else { return }
        destinationVC.wireFrame = CharacterDetailsWireFrame(viewController: destinationVC)
        destinationVC.wireFrame?.interactor.character = character
        navigateToDetails(destination: destinationVC)
    }
    
    func navigateToDetails(destination: CharacterDetailsTableViewController) {
        viewController?.show(destination, sender: nil)
    }
}
