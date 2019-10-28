//
//  UICollectionViewFlowLayoutExtension.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout {
    func configFlowLayoutSize(viewWidth: CGFloat) {
        let itemSize:CGFloat = 0.45
        let itemEdge:CGFloat = (1-(itemSize*2))/3
        self.itemSize = CGSize(width: viewWidth * itemSize, height: viewWidth * itemSize)
        self.sectionInset = UIEdgeInsets(top: viewWidth * itemEdge, left: viewWidth * itemEdge, bottom: viewWidth * itemEdge, right: viewWidth * itemEdge)
    }
}
