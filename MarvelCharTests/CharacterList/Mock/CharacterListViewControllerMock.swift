//
//  CharacterListViewControllerMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterListViewControllerMock: CharacterListViewControllerProtocol {
    var showCharactersIsCalled = false
    var showErrorIsCalled = false
    
    func showCharacters() {
        showCharactersIsCalled = true
    }
    
    func showError(state: State) {
        showErrorIsCalled = true
    }
}
