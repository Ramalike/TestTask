//
//  OrderListTableViewCell.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import UIKit

protocol OrderListTableViewCellProtocol: AnyObject {
    var viewModel: OrderListCellViewModel? { get }
}

final class OrderListTableViewCell: UITableViewCell, OrderListTableViewCellProtocol {
    
    //MARK: Properties
    private var dataLabel = UILabel(font: .helvetica17Bold())
    private var startCityLabel = UILabel(font: .helvetica14Light())
    private var startImage: UIImageView = .circleImageView()
    private var startAdressLabel = UILabel(font: .helvetica17())
    private var endCityLabel = UILabel(font: .helvetica14Light())
    private var endImage: UIImageView = .circleImageView()
    private var endAdressLabel = UILabel(font: .helvetica17())
    private var price = UILabel(font: .helvetica19Bold())
   
    weak var viewModel: OrderListCellViewModel? {
        willSet(viewModel) {
            dataLabel.text = viewModel?.orderTime
            startCityLabel.text = viewModel?.startCityAdress
            startAdressLabel.text = viewModel?.startAdress
            endCityLabel.text = viewModel?.endCityAdress
            endAdressLabel.text = viewModel?.endAdress
            price.text = viewModel?.price
            setupUI()
            setupConstraints()
        }
    }
    
    
    //MARK: Setup UI
    
    private func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = .white
    }
    
    //MARK: Setup Constraints
    
    private func setupConstraints() {
        let view = UIView()
        addSubview(view)
        view.layer.cornerRadius = 7
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        let startAdressTextStackView = UIStackView(arrangedSubviews: [startCityLabel, startAdressLabel],
                                                   axis: .vertical,
                                                   spacing: 5)
        let startAdressStackView = UIStackView(arrangedSubviews:
                                                [startImage, startAdressTextStackView],
                                               axis: .horizontal,
                                               spacing: 10)
        let endAdressTextStackView = UIStackView(arrangedSubviews: [endCityLabel, endAdressLabel],
                                                 axis: .vertical,
                                                 spacing: 5)
        let endAdressStackView = UIStackView(arrangedSubviews:
                                                [endImage, endAdressTextStackView],
                                             axis: .horizontal,
                                             spacing: 10)
        let orderInfoStackView = UIStackView(arrangedSubviews:
                                                [startAdressStackView, endAdressStackView],
                                             axis: .vertical,
                                             spacing: 10)
        let orderStackView = UIStackView(arrangedSubviews: [orderInfoStackView, price], axis: .horizontal, spacing: 40)
        
        view.addSubview(dataLabel)
        view.addSubview(orderStackView)
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            dataLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            price.widthAnchor.constraint(equalToConstant: 100),
            
            orderStackView.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 10),
            orderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            orderStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            orderStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ])
    }
}

