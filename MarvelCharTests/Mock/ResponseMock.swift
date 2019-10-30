//
//  ResponseMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

struct ResponseMock {
    static func characterResponseMock() -> MarvelCharacter.Response {
        let response = MarvelCharacter.Response(response: ResponseObject(code: 1020,
                                                                         copyright: "© 2019 MARVEL",
                                                                         attributionText: "Data provided by Marvel. © 2019 MARVEL",
                                                                         data: dataClassMock()))
        return response
    }
    
    static func characterRequestMock() {
        
    }
    
    static func dataClassMock() -> DataClass {
        let dataClass = DataClass(total: 1,
                                  results: [resultMock()])
        return dataClass
    }
    
    static func resultMock() -> Result {
        let result = Result(id: 1,
                            isFavorite: true,
                            name: "Homem de Ferro",
                            title: "",
                            description: "Rico, playboy, filantropo",
                            thumbnail: thumbnailMock())
        return result
    }
    
    static func thumbnailMock() -> Thumbnail {
        let thumbnail = Thumbnail(path: "http://teste.com/",
                                  fileExtension: "jpeg")
        return thumbnail
    }
}
