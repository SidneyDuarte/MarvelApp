//
//  FavoriteCharactersPresenter.swift
//  MarvelChar
//
//  Created by SidneySilva on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharactersPresenterProtocol {
    var viewController: FavoriteCharacterViewControllerProtocol? { get set }
    func showCharacters()
    func emptyState(state: State)
}

class FavoriteCharactersPresenter: FavoriteCharactersPresenterProtocol {
    var viewController: FavoriteCharacterViewControllerProtocol?
    
    func showCharacters() {
        self.viewController?.showCharacters()
    }
    
    func emptyState(state: State) {
        viewController?.emptyState(state: state)
    }
}
