//
//  DetailViewController.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 05.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    private let vehicleImage = UIImageView()
    private let timeLabel = UILabel(font: .helvetica14Light())
    private let orderTimeLabel = LabelWithLine(font: .helvetica17())
    private let modelNameLabel = LabelWithLine(font: .helvetica17())
    private let regNumberLabel = LabelWithLine(font: .helvetica17())
    private let driverNameLabel = LabelWithLine(font: .helvetica17())
    
    weak var viewModel: DetailViewControllerViewModelProtocol? {
        didSet {
            if viewModel?.order != nil {
                guard let id = viewModel?.id else {
                    showAllert(error: NetworkError.irconectData); return
                }
                setupViewElements()
                viewModel?.imageManager.getImageData(id: id, complition: { [weak self] data in
                    self?.vehicleImage.image = UIImage(data: data)
                })
            } else {
                showAllert(error: NetworkError.irconectData)
            }
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    //MARK: Private methods, setup UI
    private func setupUI() {
        title = "Order detail"
        vehicleImage.layer.cornerRadius = 8
        vehicleImage.clipsToBounds = true
        vehicleImage.contentMode = .scaleAspectFill
        view.backgroundColor = .white
    }
    
    private func setupViewElements() {
        guard let unwrapViewModel = viewModel else {
            return
        }
        let dateFortmater = DateFormatter()
        dateFortmater.dateFormat = "E, d MMM yyyy HH:mm"
        timeLabel.text = "Info"
        modelNameLabel.text = "Car: " + (unwrapViewModel.order?.vehicle.modelName)!
        regNumberLabel.text = "Register number: " + (unwrapViewModel.order?.vehicle.regNumber)!
        driverNameLabel.text = "Driver name: " + (unwrapViewModel.order?.vehicle.driverName)!
        orderTimeLabel.text = "Order time: " + dateFortmater.string(from: unwrapViewModel.order!.orderTime)
    }
    
    private func setupConstraints() {
        let grayView = UIView()
        grayView.backgroundColor = .secondarySystemBackground
        grayView.layer.cornerRadius = 8
        grayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayView)
        
        let infoStackView = UIStackView(arrangedSubviews: [
            timeLabel,
            orderTimeLabel,
            modelNameLabel,
            regNumberLabel,
            driverNameLabel], axis: .vertical, spacing: 10)
        
        grayView.addSubview(infoStackView)
        grayView.addSubview(vehicleImage)
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        vehicleImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            grayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            grayView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            grayView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            grayView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            infoStackView.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 10),
            infoStackView.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 10),
            infoStackView.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -10),
            infoStackView.bottomAnchor.constraint(lessThanOrEqualTo: grayView.bottomAnchor, constant: -100),
            
            vehicleImage.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            vehicleImage.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 15),
            vehicleImage.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -18),
            vehicleImage.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -10),
        ])
    }
    
    private func showAllert(error: Error) {
        let allertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        allertController.addAction(UIAlertAction.init(title: "Try again", style: .default))
        present(allertController, animated: true, completion: nil)
    }
}
