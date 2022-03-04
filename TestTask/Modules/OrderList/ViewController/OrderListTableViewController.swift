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
        
        let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.leftBarButtonItem = button
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
   
    private func setupUI() {
        title = "Order list"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
    }
    @objc func refresh() {
        tableView.reloadData()
    }
}
