//
//  CharacterListPresenter.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

protocol CharacterListPresenterProtocol {
    func showCharacters(dataClass: DataClass?)
    func showError(error: String)
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    weak var viewController: CharacterListViewControllerProtocol?
    
    func showCharacters(dataClass: DataClass?) {
        viewController?.showCharacters(dataClass: dataClass)
    }
    
    func showError(error: String) {
        viewController?.showError(error: error)
    }
}
