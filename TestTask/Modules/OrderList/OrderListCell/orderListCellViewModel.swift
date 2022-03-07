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

final class OrderListCellViewModel: OrderListCellViewModelProtocol {
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
        return String("\(orders.price.amount / 100).\(orders.price.amount % 100) \(orders.price.currency)")
    }
    
    var orderTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy, EEEE"
        let orderTime = formatter.string(from: orders.orderTime)
        return orderTime
    }
   
    init(order: FullData) {
        orders = order
    }
}
