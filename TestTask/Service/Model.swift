//
//  Model.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import Foundation

// MARK: - MainData
struct FullData: Codable {
    let id: Int
    let startAddress, endAddress: Address
    let price: Price
    let orderTime: Date
    let vehicle: Vehicle
}

// MARK: - Address
struct Address: Codable {
    let city, address: String
}

// MARK: - Price
struct Price: Codable {
    let amount: Int
    let currency: String
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let regNumber, modelName, photo, driverName: String
}

typealias MainData = [FullData]

