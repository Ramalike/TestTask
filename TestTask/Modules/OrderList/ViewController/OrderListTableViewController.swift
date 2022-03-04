//
//  OrderListTableViewController.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import UIKit

class OrderListTableViewController: UITableViewController {

    var viewModel: ViewControllerViewModelProtocol!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    
        viewModel = ViewControllerViewModel()
        viewModel.getOrders(tableView: tableView) { [unowned self] error in
            self.showAllertError(withError: error)
        }
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
   //MARK: UI setting
  
    func showAllertError(withError error: Error) {
        let error = error.localizedDescription
        let allertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        allertController.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
        present(allertController, animated: true)
    }
    
    private func setupUI() {
        title = "Order list"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.register(OrderListTableViewCell.self, forCellReuseIdentifier: "orderCell")
    }

}
