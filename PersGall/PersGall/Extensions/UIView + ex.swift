//
//  UIView + ex.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 16.02.2024.
//

import UIKit

extension UIView {
//    static func configure<T: UIView>(view: T, block: @escaping (T) -> ()) -> T {
//        view.translatesAutoresizingMaskIntoConstraints = false
//        block(view)
//        return view
//    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
