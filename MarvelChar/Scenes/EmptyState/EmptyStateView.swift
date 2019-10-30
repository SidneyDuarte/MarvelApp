//
//  EmptyStateView.swift
//  MarvelChar
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

enum State {
    case noInternet
    case requestFailure
    case wrongName
    case noResult
}

class EmptyStateView: UIView {
    @IBOutlet weak var emptyStateImage: UIImageView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    class func instanceFromNib(state: State) -> EmptyStateView? {
        let view = UINib(nibName: "EmptyStateRequest", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? EmptyStateView
        switch state {
        case .noInternet:
            view?.emptyStateImage.image = #imageLiteral(resourceName: "deadpoolNoInternet")
            view?.emptyStateLabel.text = "Parece que temos um problema de conexão. Já experimentou pagar a conta da internet?"
            break
        case .requestFailure:
            view?.emptyStateImage.image = #imageLiteral(resourceName: "deadpoolRequestError")
            view?.emptyStateLabel.text = "Parece que temos um problema. Talvez o servidor caiu ou o programador fez o request errado."
            break
        case .wrongName:
            view?.emptyStateImage.image = #imageLiteral(resourceName: "deadpoolNoSearch")
            view?.emptyStateLabel.text = "Hmm... Não achamos ninguém. Já tentou digitar o nome de quem procura inglês (tipo Cyclops em vez de Ciclope) ou aprender a escrever?"
            break
        case .noResult:
            view?.emptyStateImage.image = #imageLiteral(resourceName: "deadpoolEmptyList")
            view?.emptyStateLabel.text = "Parece que não há ninguém aqui, mas não se preocupe, eu estarei aqui para te consolar."
            break
        }
        return view
    }
}
