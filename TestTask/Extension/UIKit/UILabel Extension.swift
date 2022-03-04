//
//  Label Extension.swift
//  TestTask
//
//  Created by Рамиль Мухаррямов on 02.03.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "",
                     font: UIFont?,
                     color: UIColor = .black,
                     lines: Int = 1,
                     alignment: NSTextAlignment = .left) {
      self.init()
      
      self.text = text
      self.textColor = color
      self.font = font
      self.adjustsFontSizeToFitWidth = true
      self.numberOfLines = lines
      self.textAlignment = alignment
    }
}
