//
//  OrderListViewControoleViewModel.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 03.03.2022.
//

import Foundation
import UIKit

protocol ViewControllerViewModelProtocol {
    var nubmerOfRowInSection: Int { get }
    func returnCell(forindexPath indexPath: IndexPath) -> OrderListCellViewModelProtocol?
    func getOrders(tableView: UITableView, funcShowAllert: @escaping (Error) -> Void)
}

class ViewControllerViewModel: ViewControllerViewModelProtocol {
    var nubmerOfRowInSection: Int {
        orders?.count ?? 0
    }
    var networkManager: NetworkManagerProtocol? = NetworkManager()
    
    var orders: MainData?
   
    func getOrders(tableView: UITableView, funcShowAllert: @escaping (Error) -> Void) {
        networkManager?.getList { [weak self] result in
            switch result {
                
            case .success(var fetchedOrders):
                fetchedOrders.sort {
                    $0.orderTime > $1.orderTime
                }
                self?.orders = fetchedOrders
               
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            case .failure(let error):
                funcShowAllert(error)
            }
        }
    }
    
    func returnCell(forindexPath indexPath: IndexPath) -> OrderListCellViewModelProtocol? {
        
        guard var data = orders else { return nil }
        data.sort {
            $0.orderTime > $1.orderTime
        }
        let order =  data[indexPath.row]
        print(order)
        return OrderListCellViewModel(order: order)
    }
    

}
