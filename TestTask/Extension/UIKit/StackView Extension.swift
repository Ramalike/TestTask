//
//  StackView Extension.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//


import UIKit

extension UIStackView {
  convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
    self.init(arrangedSubviews: arrangedSubviews)
    self.axis = axis
    self.spacing = spacing
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
