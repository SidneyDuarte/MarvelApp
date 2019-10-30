//
//  CharacterDetailsPresenter.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterDetailsPresenterProtocol {
    var viewController: CharacterDetailsTableViewControllerProtocol? { get set }
    func displayInfo(character: Result)
    func displaySeries()
    func displayComics()
    func showError()
    func saveFromFavorite()
    func revomeFromFavorite()
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    var viewController: CharacterDetailsTableViewControllerProtocol?
    
    func displayInfo(character: Result) {
        let thumbnail = character.thumbnail
        let url = URL(string: "\(thumbnail?.path ?? "").\(thumbnail?.fileExtension ?? "")")
        viewController?.displayInfo(character: character, imageUrl: url)
    }
    
    func displaySeries() {
        viewController?.displaySeries()
    }
    
    func displayComics() {
        viewController?.displayComics()
    }
    
    func saveFromFavorite() {
        viewController?.saveFromFavorites()
    }
    
    func revomeFromFavorite() {
        viewController?.removeFromFavorites()
    }
    
    func showError() {
        viewController?.getError()
    }
}
