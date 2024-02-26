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
    private var tagScrollCollectionView: UICollectionView!
    private var photoCountLabel = UILabel()
    private var commentCountLabel = UILabel()
    
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
    
    // MARK: - Methods
    private func contentViewConfig() {
        addSubview(postImage)
        layer.cornerRadius = 30
        clipsToBounds = true
        
        setViewGradient(frame: bounds,
                        startPoint: CGPoint(x: 0.5, y: 1),
                        endPoint: CGPoint(x: 0.5, y: 0.5),
                        colors: [.black, .clear],
                        location: [0.1])
    }
    
    func configureCell(item: PostItem) {
        postImage.image = UIImage(named: item.photos.first ?? "plus.app")
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
