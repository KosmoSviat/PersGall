//
//  TagCollectionCell.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 28.02.2024.
//

import UIKit

class TagCollectionCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseId = "TagCollectionCell"
    
    // MARK: - GUI Variables
    private lazy var tagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // tagView
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagView.topAnchor.constraint(equalTo: topAnchor),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // tagLabel
            tagLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 5),
            tagLabel.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -5),
            tagLabel.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 20),
            tagLabel.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -20)
        ])
    }
    
    func configureCell(tagText: String) {
        self.tagLabel.text = tagText
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagView)
        tagView.addSubview(tagLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
