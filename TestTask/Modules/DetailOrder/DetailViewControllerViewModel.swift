//
//  DetailViewControllerViewModel.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 05.03.2022.
//

import Foundation

protocol DetailViewControllerViewModelProtocol: AnyObject {
    var order: FullData? { get }
    var id: String { get }
    var imageManager: ImageManagerProtocol { get set }
}


class DetailViewControllerViewModel: DetailViewControllerViewModelProtocol {
    var imageManager: ImageManagerProtocol = ImageManager()
    var order: FullData?
    var id: String
    init(order: FullData) {
        self.order = order
        id = String(describing: order.vehicle.photo)
    }
}
