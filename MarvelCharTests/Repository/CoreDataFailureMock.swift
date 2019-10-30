//
//  CoreDataFailureMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class CoreDataFailureMock: CoreDataManagerProtocol {
    func saveCharacter(character: Result) { }
    
    func retrieveCharacters() -> [Result] {
        return []
    }
    
    func deleteCharacter(id: Int) { }
}
