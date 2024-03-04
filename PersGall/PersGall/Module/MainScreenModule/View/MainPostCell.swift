//
//  MainPostCell.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 22.02.2024.
//

import UIKit

class MainPostCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseID = "MainPostCell"
    private var tags: [String] = []
    private var tagCollectionView: UICollectionView!
    private var photoCountLabel = UILabel()
    private var commentCountLabel = UILabel()
    private var postDescriptionLabel = UILabel()
    private var clearView = UIView()
    
    // MARK: - GUI Variables
    private lazy var postImage: UIImageView = {
        let image = UIImageView(frame: bounds)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var countLabelStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    private lazy var addFavoriteButton: UIButton = {
        let button = UIButton(primaryAction: nil)
        button.frame = CGRect(x: bounds.width - 60, y: 35, width: 30, height: 25)
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Methods
    private func contentViewConfig() {
        addSubviews([postImage, addFavoriteButton])
        layer.cornerRadius = 30
        clipsToBounds = true
        setViewGradient(frame: bounds,
                        startPoint: CGPoint(x: 0.5, y: 1),
                        endPoint: CGPoint(x: 0.5, y: 0.5),
                        colors: [.black, .clear],
                        location: [0.1])
    }
    
    private func getCellLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.text = text
        label.textColor = .white
        return label
    }
    
    override func prepareForReuse() {
        tagCollectionView.removeFromSuperview()
        postDescriptionLabel.removeFromSuperview()
        photoCountLabel.removeFromSuperview()
        commentCountLabel.removeFromSuperview()
        clearView.removeFromSuperview()
    }
    
    func configureCell(item: PostItem) {
        tags = item.tags ?? []
        let tagCollection: TagCollectionViewProtocol = TagCollectionView(dataSource: self)
        tagCollectionView = tagCollection.getCollectionView()
        
        postImage.image = UIImage(named: item.photos.first ?? "plus.app")
        photoCountLabel = getCellLabel(text: "\(item.photos.count) фото")
        commentCountLabel = getCellLabel(text: "\(item.comments?.count ?? 0) комментариев")
        postDescriptionLabel = getCellLabel(text: item.description ?? "")
        
        addSubviews([countLabelStack, tagCollectionView, postDescriptionLabel])
        countLabelStack.addArrangedSubviews([photoCountLabel, commentCountLabel, clearView])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // countLabelStack
            countLabelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            countLabelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            countLabelStack.bottomAnchor.constraint(equalTo: tagCollectionView.topAnchor, constant: -8),
            
            // tagCollection
            tagCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagCollectionView.heightAnchor.constraint(equalToConstant: 40),
            tagCollectionView.bottomAnchor.constraint(equalTo: postDescriptionLabel.topAnchor, constant: -10),
            
            // postDescriptionLabel
            postDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainPostCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionCell.reuseId,
                                                      for: indexPath) as! TagCollectionCell
        let tag = tags[indexPath.item]
        cell.configureCell(tagText: tag)
        return cell
    }
}
