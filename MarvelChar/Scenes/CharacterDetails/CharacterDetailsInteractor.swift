//
//  CharacterDetailsInteractor.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterDetailsInteractorProtocol {
    func getInfo(character: Result?)
}

class CharacterDetailsInteractor: CharacterDetailsInteractorProtocol {
    var presenter: CharacterDetailsPresenterProtocol?
    
    func getInfo(character: Result?) {
        guard let char = character else { return }
        presenter?.displayInfo(character: char)
    }
}
