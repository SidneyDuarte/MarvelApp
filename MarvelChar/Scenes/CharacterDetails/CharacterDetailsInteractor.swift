//
//  CharacterDetailsInteractor.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterDetailsInteractorProtocol {
    func getInfo()
    func loadSeries(characterId: Int)
    func loadComics(characterId: Int)
}

class CharacterDetailsInteractor: NSObject {
    var presenter: CharacterDetailsPresenterProtocol?
    var repository: Repository?
    var comics = [Result]()
    var series = [Result]()
    var character: Result?
    var numberOfSeries = 0
    var numberOfComics = 0
}

extension CharacterDetailsInteractor: CharacterDetailsInteractorProtocol {
    func getInfo() {
        guard let character = character else {
            self.presenter?.showError(error: "nenhum personagem para apresentar")
            return
        }
        presenter?.displayInfo(character: character)
    }
    
    func loadSeries(characterId: Int) {
        let request = MarvelCharacter.Request(orderBy: "title", limit: 100, offset: 0, endpoint: "series", append: "&characters=\(characterId)")
        repository?.getResponse(request: request, success: { (response) in
            guard let series = response.response?.data?.results else {
                self.presenter?.showError(error: "Personagem não possui nenhuma série")
                return
            }
            self.numberOfSeries = series.count
            self.series = series
            self.presenter?.displaySeries()
        }, failure: { (error) in
            self.presenter?.showError(error: error)
        })
    }
    
    func loadComics(characterId: Int) {
        let request = MarvelCharacter.Request(orderBy: "title", limit: 100, offset: 0, endpoint: "comics", append: "&characters=\(characterId)")
        repository?.getResponse(request: request, success: { (response) in
            guard let comics = response.response?.data?.results else {
                self.presenter?.showError(error: "Personagem não possui nenhum quadrinho")
                return
            }
            self.comics = comics
            self.numberOfComics = comics.count
            self.presenter?.displayComics()
        }, failure: { (error) in
            
        })
    }
}
