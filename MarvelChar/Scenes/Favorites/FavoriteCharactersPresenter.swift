//
//  FavoriteCharactersPresenter.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol FavoriteCharactersPresenterProtocol {
    func showCharacters()
    func emptyState(state: State)
}

class FavoriteCharactersPresenter: FavoriteCharactersPresenterProtocol {
    weak var viewController: FavoriteCharacterViewControllerProtocol?
    
    func showCharacters() {
        self.viewController?.showCharacters()
    }
    
    func emptyState(state: State) {
        viewController?.emptyState(state: state)
    }
}
