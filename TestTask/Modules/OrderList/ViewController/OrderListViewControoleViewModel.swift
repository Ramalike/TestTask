//
//  OrderListViewControoleViewModel.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 03.03.2022.
//

import Foundation


//MARK: Protocol
protocol ViewControllerViewModelProtocol: AnyObject {
    var nubmerOfRowInSection: Int { get }
    func returnCell(forindexPath indexPath: IndexPath) -> OrderListCellViewModelProtocol?
    func getOrders(complition: @escaping (String) -> Void, successComplition: @escaping () -> Void)
    func returnDetailViewModel(indexPath: IndexPath) -> DetailViewControllerViewModelProtocol?
}
//MARK: ViewModel
final class ViewControllerViewModel: ViewControllerViewModelProtocol {
    var nubmerOfRowInSection: Int {
        orders?.count ?? 0
    }
    var networkManager: NetworkManagerProtocol? = NetworkManager()
    
    var orders: MainData?
    //MARK: Datafetch
    func getOrders(complition: @escaping (String) -> Void, successComplition: @escaping () -> Void) {
        networkManager?.getList { [weak self] result in
            switch result {
            case .success(var fetchedOrders):
                fetchedOrders.sort {
                    $0.orderTime > $1.orderTime
                }
                self?.orders = fetchedOrders
                successComplition()
            case .failure(let error):
                complition(error.localizedDescription)
            }
        }
    }

    
    func returnCell(forindexPath indexPath: IndexPath) -> OrderListCellViewModelProtocol? {
        
        guard var data = orders else { return nil }
        data.sort {
            $0.orderTime > $1.orderTime
        }
        let order =  data[indexPath.row]
        return OrderListCellViewModel(order: order)
    }
    
    func returnDetailViewModel(indexPath: IndexPath) -> DetailViewControllerViewModelProtocol? {
        guard let order = orders else { return nil }
        return DetailViewControllerViewModel(order: order[indexPath.row])
    }
    
}
