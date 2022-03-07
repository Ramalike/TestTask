//
//  OrderListTableViewController.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import UIKit

final class OrderListTableViewController: UITableViewController {
    
    private var viewModel: ViewControllerViewModelProtocol! {
        didSet {
            viewModel.getOrders { [weak self] error in
                self?.showAllertError(withError: error)
            } successComplition: {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel = ViewControllerViewModel()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nubmerOfRowInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(OrderListTableViewCell.self, forCellReuseIdentifier: "orderCell")
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as? OrderListTableViewCell else {
            fatalError("Some error")
        }
        let cellViewModel = viewModel.returnCell(forindexPath: indexPath)
        cell.viewModel = cellViewModel as? OrderListCellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.viewModel = viewModel.returnDetailViewModel(indexPath: indexPath) 
        navigationController?.pushViewController(vc, animated: true)
    }
    //MARK: UI setting
    
    func showAllertError(withError error: String) {
        let error = error
        let allertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        allertController.addAction(UIAlertAction(title: "Try again", style: .default))
        present(allertController, animated: true)
    }
    
    private func setupUI() {
        title = "Order list"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.register(OrderListTableViewCell.self, forCellReuseIdentifier: "orderCell")
    }
}
