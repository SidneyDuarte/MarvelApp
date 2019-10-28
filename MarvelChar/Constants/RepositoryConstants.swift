//
//  RepositoryConstants.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

extension Constants.RepositoryConstants {
    static let baseUrl = "https://gateway.marvel.com:443/v1/public"
    static let publicKey = "cfc55bc053d2a9f21c0f6dc9fdac2161"
    static let privateKey = "c0f944a067a598e248bcd8b62bf2a09973b5f519"
    static let ts = Date().timeIntervalSince1970
    static var hash:String {
        let string = "\(ts)\(privateKey)\(publicKey)"
        return string.getMd5Hash() ?? ""
    }
}
