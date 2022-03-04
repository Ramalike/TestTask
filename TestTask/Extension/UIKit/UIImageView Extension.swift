//
//  UIImageView Extension.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import UIKit

extension UIImageView {
  static func circleImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "circle") ?? UIImage()
    imageView.contentMode = .center
    imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(weight: .heavy)
    imageView.tintColor = .black
    imageView.setContentHuggingPriority(UILayoutPriority(300), for: .horizontal)
    return imageView
  }
}
