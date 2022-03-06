//
//  DetailViewControllerViewModel.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 05.03.2022.
//

import Foundation

protocol DetailViewControllerViewModelProtocol: AnyObject {
    var order: FullData? { get }
    var kingfisherManager: KingfisherManagerProtocol { get set }
    var id: String { get }
}


class DetailViewControllerViewModel: DetailViewControllerViewModelProtocol {
    var kingfisherManager: KingfisherManagerProtocol = KingfisherManager()
    var order: FullData?
    var id: String
    init(order: FullData) {
        self.order = order
        id = String(describing: order.vehicle.photo)
    }
}
