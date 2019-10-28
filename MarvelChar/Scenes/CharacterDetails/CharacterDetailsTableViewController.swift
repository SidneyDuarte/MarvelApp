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
}

class CharacterDetailsTableViewController: UITableViewController {
    var wireFrame: CharacterDetailsWireFrame?
    var interactor: CharacterDetailsInteractor?
    var character: Result?

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CharacterDetailsWireFrame.setup(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getInfo(character: character)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.bounds.height / 2.5
        }
        return UITableView.automaticDimension
    }
}

extension CharacterDetailsTableViewController: CharacterDetailsTableViewControllerProtocol {
    func displayInfo(character: Result, imageUrl: URL?) {
        detailLabel.text = character.description ?? ""
        detailImage.getImageUsingNSCache(imageUrl: imageUrl)
        self.title = character.name ?? ""
    }
    
    func displaySeries() {
        
    }
    
    func displayComics() {
        
    }
}
