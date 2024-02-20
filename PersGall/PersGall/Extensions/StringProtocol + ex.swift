//
//  StringProtocol + ex.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

extension StringProtocol {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}
