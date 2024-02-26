//
//  MainPostHeader.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 22.02.2024.
//

import UIKit

class MainPostHeader: UICollectionReusableView {
    // MARK: - Properties
    static let reuseID = "MainPostHeader"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.frame = CGRect(x: 30, y: 0, width: frame.width, height: frame.height)
        return label
    }()
    
    //MARK: - Init
    required override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setHeadertext(header: String?) {
        headerLabel.text = header
    }
}
