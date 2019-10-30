//
//  RepositoryFailureMock.swift
//  MarvelCharTests
//
//  Created by SidneySilva on 30/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit
@testable import MarvelChar

class RepositoryFailureMock: RepositoryProtocol {
    func getResponse(request: MarvelCharacter.Request,
                     success: @escaping Success,
                     failure: @escaping Failure) {
        failure(.requestFailure)
    }
}
