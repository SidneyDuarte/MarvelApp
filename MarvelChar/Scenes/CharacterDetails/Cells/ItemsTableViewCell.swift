//
//  ComicsTableViewCell.swift
//  MarvelChar
//
//  Created by resource on 29/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var items: [Result]?
    
    func setupCell(items: [Result], title: String) {
        titleLabel.text = title
        self.items = items
        self.collectionView.reloadData()
    }
}

extension ItemsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItensCollectionViewCell,
              let items = items else { return UICollectionViewCell() }
        let item = items[indexPath.item]
        cell.itemLabel.text = item.title ?? ""
        cell.setupImage(thumbnail: item.thumbnail)
        return cell
    }
}

extension ItemsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.size.width / 3, height: self.contentView.frame.size.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
