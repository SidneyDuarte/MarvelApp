//
//  FavoriteViewControllerMock.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class FavoriteViewControllerMock: FavoriteCharacterViewControllerProtocol {
    var showCharactersIsCalled = false
    var emptyStateIsCalled = false
    
    func showCharacters() {
        showCharactersIsCalled = true
    }
    
    func emptyState(state: State) {
        emptyStateIsCalled = true
    }
}
