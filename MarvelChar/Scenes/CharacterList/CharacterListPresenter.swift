//
//  CharacterListPresenter.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

protocol CharacterListPresenterProtocol {
    func showCharacters()
    func showError(state: State)
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    weak var viewController: CharacterListViewControllerProtocol?
    
    func showCharacters() {
        viewController?.showCharacters()
    }
    
    func showError(state: State) {
        viewController?.showError(state: state)
    }
}
