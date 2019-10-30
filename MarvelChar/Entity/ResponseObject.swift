//
//  ResponseObject.swift
//  MarvelChar
//
//  Created by SidneySilva on 27/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

struct ResponseObject: Decodable {
    let code: Int?
    let copyright: String?
    let attributionText: String?
    let data: DataClass?
}

struct DataClass: Decodable {
    let total: Int?
    let results: [Result]?
}

struct Result: Decodable {
    let id: Int?
    var isFavorite: Bool?
    let name: String?
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
}

struct Thumbnail: Decodable {
    let path: String?
    let fileExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case fileExtension = "extension"
        case path
    }
}

extension ResponseObject {
    static func parse(responseData: Data?) -> ResponseObject? {
        var response: ResponseObject?
        guard let data = responseData else { return response }
        do {
            let decoder = JSONDecoder()
            response = try decoder.decode(ResponseObject.self, from: data)
        } catch let err {
            print("Error: ", err)
        }
        
        return response
    }
}

