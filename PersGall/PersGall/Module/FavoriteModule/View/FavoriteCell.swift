//
//  FavoriteCell.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 4.03.2024.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    // MARK: - GUI Variables
    private lazy var postImage: UIImageView = {
        let image = UIImageView(frame: bounds)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var removeFromFavoriteButton: UIButton = {
        let button = UIButton(primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: bounds.width - 43, y: 21, width: 30, height: 25)
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var dateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 10, y: bounds.height - 47, width: bounds.width - 20, height: 25)
        view.backgroundColor = UIColor(white: 1, alpha: 0.4)
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 0, width: bounds.width - 20, height: 27)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Properties
    static let reuseId = "FavoriteCell"
    
    // MARK: - Methods
    private func setupCell() {
        addSubviews([postImage, removeFromFavoriteButton, dateView])
        dateView.addSubview(dateLabel)
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    func configureCell(item: PostItem) {
        postImage.image = UIImage(named: item.photos.first!)
        dateLabel.text = item.date.formateDate()
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
