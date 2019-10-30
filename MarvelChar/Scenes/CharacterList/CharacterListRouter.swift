//
//  CharacterListRouter.swift
//  MarvelChar
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterListRouterProtocol {
    var viewController: CharacterListViewController? { get set }
    func routeToShowDetails(character: Result)
}

class CharacterListRouter: CharacterListRouterProtocol {
    var viewController: CharacterListViewController?
    
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
