//
//  RepositorySuccessMock.swift
//  MarvelCharTests
//
//  Created by resource on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class RepositorySuccessMock: RepositoryProtocol {
    func getResponse(request: MarvelCharacter.Request,
                     success: @escaping Success,
                     failure: @escaping Failure) {
        success(ResponseMock.characterResponseMock())
    }
}
