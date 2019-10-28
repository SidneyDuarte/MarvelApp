//
//  CharacterListWireframe.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class CharacterListWireframe: NSObject {
    var viewController: CharacterListViewController?

    func routeToShowDetails(character: Result) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "CharacterDetailsTableViewController") as? CharacterDetailsTableViewController else { return }
        destinationVC.character = character
        navigateToDetails(destination: destinationVC)
    }
    
    func navigateToDetails(destination: CharacterDetailsTableViewController) {
        viewController?.show(destination, sender: nil)
    }
    
    class func setup(viewController: CharacterListViewController) {
        let presenter = CharacterListPresenter()
        let interactor = CharacterListInteractor()
        let wireFrame = CharacterListWireframe()
        let repository = Repository()
        
        viewController.interactor = interactor
        viewController.wireFrame = wireFrame
        interactor.presenter = presenter
        interactor.repository = repository
        presenter.viewController = viewController
        wireFrame.viewController = viewController
    }
}
