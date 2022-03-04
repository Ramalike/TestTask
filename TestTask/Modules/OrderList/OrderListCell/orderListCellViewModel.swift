//
//  orderListCellViewModel.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 03.03.2022.
//

import Foundation

protocol OrderListCellViewModelProtocol: AnyObject {
    var orders: FullData { get set }
    
}

class OrderListCellViewModel: OrderListCellViewModelProtocol {
    var orders: FullData
    
    var startCityAdress: String {
        return orders.startAddress.city
    }
    
    var startAdress: String {
        return orders.startAddress.address
    }
    
    var endCityAdress: String {
        return orders.endAddress.city
    }
    
    var endAdress: String {
        return orders.endAddress.address
    }
    
    var price: String {
        return String(describing: orders.price)
    }
    
    var orderTime: String {
        return String(describing: orders.orderTime)
    }
   
    init(order: FullData) {
        orders = order
    }
}
