//
//  UIStackView + ex.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 16.02.2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
