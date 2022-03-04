//
//  NetworkError.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 03.03.2022.
//

import Foundation

enum NetworkError: Error {
    case lostNetworkConnection
    case irconectData
    case serverError(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .irconectData:
            return "Incorrect data"
        case .lostNetworkConnection:
            return "Lost network connection"
        case.serverError(let error):
            return "Server error: \(error.localizedDescription)"
        }
    }
}


