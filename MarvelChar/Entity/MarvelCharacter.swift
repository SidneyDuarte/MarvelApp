//
//  MarvelCharacter.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

struct MarvelCharacter {
    struct Request {
        var orderBy: String
        var limit: Int
        var offset: Int
        var endpoint: String
        var append: String
        
        func getUrl() -> String {
            let constants = Constants.RepositoryConstants.self
            let url = "\(constants.baseUrl)/\(endpoint)?ts=\(constants.ts)&hash=\(constants.hash)&apikey=\(constants.publicKey)\(append)&orderBy=\(orderBy)&limit=\(limit)&offset=\(offset)"
            return url
        }
    }
    
    struct Response {
        let response: ResponseObject?
    }
}


