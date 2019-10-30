//
//  CharacterListPresenterMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CharacterListPresenterMock: CharacterListPresenterProtocol {
    var viewController: CharacterListViewControllerProtocol?
    var showCharacterIsCalled = false
    var showErrorIsCalled = false
    
    func showCharacters() {
        showCharacterIsCalled = true
    }
    
    func showError(state: State) {
        showErrorIsCalled = true
    }
}
