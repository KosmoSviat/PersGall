//
//  TagCollection.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 28.02.2024.
//

import UIKit

protocol TagCollectionViewProtocol: AnyObject {
    var dataSource: UICollectionViewDataSource { get set }
    var isEditing: Bool { get set }
    func getCollectionView() -> UICollectionView
    init(dataSource: UICollectionViewDataSource)
}

class TagCollectionView: TagCollectionViewProtocol {
    var dataSource: UICollectionViewDataSource
    var isEditing: Bool = false
    
    func getCollectionView() -> UICollectionView {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceHorizontal = true
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self.dataSource
        collection.backgroundColor = .clear
        collection.register(TagCollectionCell.self, forCellWithReuseIdentifier: TagCollectionCell.reuseId)
        
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return collection
    }
    
    required init(dataSource: UICollectionViewDataSource) {
        self.dataSource = dataSource
    }
}
