//
//  CharacterDetailsTableViewController.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

protocol CharacterDetailsTableViewControllerProtocol {
    func displayInfo(character: Result, imageUrl: URL?)
    func displaySeries()
    func displayComics()
    func saveFromFavorites()
    func removeFromFavorites()
    func showError(string: String)
}

class CharacterDetailsTableViewController: UITableViewController {
    var wireFrame: CharacterDetailsWireFrame?
    var loadingView: LoadingView?
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wireFrame?.interactor.getInfo()
        configureLoadingView()
    }
    
    func configureLoadingView() {
        loadingView = LoadingView.instanceFromNib()
        loadingView?.frame = self.view.frame
        view.addSubview(loadingView ?? UIView())
    }
    
    @IBAction func didTapFavorite(_ sender: Any) {
        let isFavorite = wireFrame?.interactor.character?.isFavorite ?? false
        if isFavorite {
             wireFrame?.interactor.removeFromFavorites()
        } else {
            wireFrame?.interactor.saveFromFavorite()
        }
    }
}

//MARK: - tableView datasources e delegates

extension CharacterDetailsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            let items = wireFrame?.interactor.numberOfComics ?? 0
            return items > 0 ? 1 : 0
        case 2:
            let items = wireFrame?.interactor.numberOfSeries ?? 0
            return items > 0 ? 1 : 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterImageCell", for: indexPath) as? CharacterImageTableViewCell else { return UITableViewCell() }
                cell.setupImage(thumbnail: wireFrame?.interactor.character?.thumbnail)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterInfoCell", for: indexPath) as? CharacterInfoTableViewCell else { return UITableViewCell() }
                cell.infoLabel.text = wireFrame?.interactor.character?.description ?? ""
                return cell
            }
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetailsCell", for: indexPath) as? ItemsTableViewCell,
                let comics = wireFrame?.interactor.comics else { return UITableViewCell() }
            cell.setupCell(items: comics, title: "comics")
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetailsCell", for: indexPath) as? ItemsTableViewCell,
                  let series = wireFrame?.interactor.series else { return UITableViewCell() }
            cell.setupCell(items: series, title: "Series")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return self.view.bounds.height / 2.5
            }
            return UITableView.automaticDimension
        case 1, 2:
            return self.view.bounds.height / 4
        default:
            return 0
        }
    }
}

//MARK: - CharacterDetails protocol

extension CharacterDetailsTableViewController: CharacterDetailsTableViewControllerProtocol {
    func displayInfo(character: Result, imageUrl: URL?) {
        self.title = character.name ?? ""
        let isFavorite = character.isFavorite ?? false
        barButton.tintColor = isFavorite ? UIColor.yellow : UIColor.gray
        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        wireFrame?.interactor.loadComics(characterId: character.id ?? 0)
    }
    
    func displayComics() {
        let id = wireFrame?.interactor.character?.id ?? 0
        wireFrame?.interactor.loadSeries(characterId: id)
        DispatchQueue.main.async {
            self.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
        }
    }
    
    func displaySeries() {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.tableView.reloadSections(IndexSet(integer: 2), with: .automatic)
        }
    }
    
    func saveFromFavorites() {
        wireFrame?.interactor.character?.isFavorite = true
        barButton.tintColor = UIColor.yellow
    }
    
    func removeFromFavorites() {
        wireFrame?.interactor.character?.isFavorite = false
        barButton.tintColor = UIColor.gray
    }
    
    func showError(string: String) {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
        }
    }
}
