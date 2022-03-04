//
//  DaraFetchManager.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    var baseUrlString: String { get set }
    func getList(complition: @escaping (Result<MainData, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    var baseUrlString = "https://www.roxiemobile.ru/careers/test/orders.jsonx`"
    
    func getList(complition: @escaping (Result<MainData, Error>) -> Void) {
        request(url: baseUrlString) { (result: Result<MainData, Error>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    complition(.success(success))
                    print(success)
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    complition(.failure(failure))
                }
            }
        }
        
    }
    
    func request<T: Decodable>(url: String, complition: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    DispatchQueue.main.async {
                        complition(.failure(NetworkError.serverError(error: error)))
                    }
                    return
                }
                DispatchQueue.main.async {
                    complition(.failure(NetworkError.lostNetworkConnection.errorDescription as! Error))
                }
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let result = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    complition(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    complition(.failure(NetworkError.irconectData))
                }
            }
        }
        task.resume()
    }
}
