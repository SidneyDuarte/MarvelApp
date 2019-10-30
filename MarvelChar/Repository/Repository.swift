//
//  Repository.swift
//  MarvelChar
//
//  Created by SidneySilva on 26/10/19.
//  Copyright © 2019 SakuraSoft. All rights reserved.
//

import UIKit

typealias Success = (_ result: MarvelCharacter.Response) -> ()
typealias Failure = (_ state: State) -> ()

class Repository: NSObject {
    func getResponse(request: MarvelCharacter.Request,
                              success: @escaping Success,
                              failure: @escaping Failure) {
        guard let baseUrl = URL(string: request.getUrl()) else { return }
        let urlRequest = createRequest(url: baseUrl)
        if Reachability.isInternetAvailable() {
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                failure(.requestFailure)
                return
            }
            
            guard let response = ResponseObject.parse(responseData: data) else {
                failure(.requestFailure)
                return
            }
            
            guard response.code == 200 else {
                failure(.requestFailure)
                return
            }
            
            success(MarvelCharacter.Response(response: response))
            }.resume()
        } else {
            failure(.noInternet)
        }
        
    }
    
    private func createRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}
