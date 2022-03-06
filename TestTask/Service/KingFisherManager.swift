//
//  KingFisherManager.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 05.03.2022.
//

import UIKit
import Kingfisher

protocol KingfisherManagerProtocol: AnyObject {
    func fetchImage(id: String, image: UIImageView, handler:  @escaping (Error) -> Void)
}

class KingfisherManager: KingfisherManagerProtocol {
    private var baseUrl = "https://www.roxiemobile.ru/careers/test/images/"
    
    func fetchImage(id: String, image: UIImageView, handler: @escaping (Error) -> Void) {
        guard let url = URL(string: baseUrl + id) else { return }
        let resource = ImageResource(downloadURL: url)
        image.kf.indicatorType = .activity
        
        image.kf.setImage(with: resource) { (result: Result<RetrieveImageResult, KingfisherError>) in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                handler(error)
                print(error)
            }
        }
    }
    
}
