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
    func getOrders(tableView: UITableView)
}

class ViewControllerViewModel: ViewControllerViewModelProtocol {
    var nubmerOfRowInSection: Int {
        orders?.count ?? 0
    }
    var networkManager: NetworkManagerProtocol? = NetworkManager()
    
    var orders: MainData?
   
    func getOrders(tableView: UITableView) {
        networkManager?.getList { [weak self] result in
            switch result {
                
            case .success(let orders):
                self?.orders = orders
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
                print(orders)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func returnCell(forindexPath indexPath: IndexPath) -> OrderListCellViewModelProtocol? {
        guard let data = orders else { return nil }
        let order =  data[indexPath.row]
        print(order)
        return OrderListCellViewModel(order: order)
    }
    

    
}
