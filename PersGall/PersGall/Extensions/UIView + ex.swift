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
    
    func setViewGradient(frame: CGRect, startPoint: CGPoint, endPoint: CGPoint, colors: [UIColor], location: [NSNumber]) {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map {
            $0.cgColor
        }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.locations = location
        
        self.layer.addSublayer(gradient)
    }
}
