//
//  CharacterDetailsInteractor.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterDetailsInteractorProtocol {
    var presenter: CharacterDetailsPresenterProtocol? { get set }
    var repository: RepositoryProtocol? { get set }
    var coreDataManager: CoreDataManagerProtocol? { get set }
    var comics: [Result]  { get }
    var series: [Result]  { get }
    var character: Result?  { get set }
    var numberOfSeries: Int  { get }
    var numberOfComics: Int  { get }
    func getInfo()
    func loadSeries(characterId: Int)
    func loadComics(characterId: Int)
    func setupFavorite(isFavorite: Bool)
}

class CharacterDetailsInteractor: NSObject {
    var presenter: CharacterDetailsPresenterProtocol?
    var repository: RepositoryProtocol?
    var coreDataManager: CoreDataManagerProtocol?
    var comics = [Result]()
    var series = [Result]()
    var character: Result?
    var numberOfSeries = 0
    var numberOfComics = 0
}

extension CharacterDetailsInteractor: CharacterDetailsInteractorProtocol {
    func getInfo() {
        guard let character = character else {
            self.presenter?.showError()
            return
        }
        presenter?.displayInfo(character: character)
    }
    
    func loadSeries(characterId: Int) {
        let request = MarvelCharacter.Request(orderBy: "title", limit: 100, offset: 0, endpoint: "series", append: "&characters=\(characterId)")
        repository?.getResponse(request: request, success: { (response) in
            guard let series = response.response?.data?.results else {
                self.presenter?.showError()
                return
            }
            self.numberOfSeries = series.count
            self.series = series
            self.presenter?.displaySeries()
        }, failure: { (state) in
            self.presenter?.showError()
        })
    }
    
    func loadComics(characterId: Int) {
        let request = MarvelCharacter.Request(orderBy: "title", limit: 100, offset: 0, endpoint: "comics", append: "&characters=\(characterId)")
        repository?.getResponse(request: request, success: { (response) in
            guard let comics = response.response?.data?.results else {
                self.presenter?.showError()
                return
            }
            self.comics = comics
            self.numberOfComics = comics.count
            self.presenter?.displayComics()
        }, failure: { (state) in
            self.presenter?.showError()
        })
    }
    
    func setupFavorite(isFavorite: Bool) {
        if isFavorite {
            guard let id = self.character?.id else { return }
            coreDataManager?.deleteCharacter(id: id)
            presenter?.revomeFromFavorite()
        } else {
            guard let character = self.character else { return }
            coreDataManager?.saveCharacter(character: character)
            presenter?.saveFromFavorite()
        }
    }
}
