//
//  ClientError.swift
//  TheMovie
//
//  Created by Jeiel Lima on 28/05/24.
//

import Foundation

enum APIErrors: Error {
    static let requestFailed = Text.Error.requestError
    static let noData = Text.Error.dataRecieve
    static let jsonError = Text.Error.jsonError
}
