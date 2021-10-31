//
//  ApiError.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/18/21.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case invalidResponse
    case invalidPass
    case unableToComplete
}
