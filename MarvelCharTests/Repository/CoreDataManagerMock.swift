//
//  CoreDataManagerSuccessMock.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CoreDataManagerMock: CoreDataManagerProtocol {
    var saveIsCalled = false
    var deleteIsCalled = false
    
    func saveCharacter(character: Result) {
        saveIsCalled = true
    }
    
    func retrieveCharacters() -> [Result] {
        return [ResponseMock.resultMock()]
    }
    
    func deleteCharacter(id: Int) {
        deleteIsCalled = true
    }
}
