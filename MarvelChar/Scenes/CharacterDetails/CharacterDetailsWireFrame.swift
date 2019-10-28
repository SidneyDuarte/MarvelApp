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
    
    class func setup(viewController: CharacterDetailsTableViewController) {
        let presenter = CharacterDetailsPresenter()
        let interactor = CharacterDetailsInteractor()
        let wireFrame = CharacterDetailsWireFrame()
        
        viewController.interactor = interactor
        viewController.wireFrame = wireFrame
        interactor.presenter = presenter
        presenter.viewController = viewController
        wireFrame.viewController = viewController
    }
}
