//
//  FavoriteView.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

protocol FavoriteViewProtocol: AnyObject {
    func showPosts()
}

class FavoriteView: UIViewController {
    // MARK: - GUI Variables
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .appMain
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceVertical = true
        view.dataSource = self
        view.delegate = self
        view.register(FavoriteCell.self, forCellWithReuseIdentifier: FavoriteCell.reuseId)
        
        let itemSize = ((view.bounds.width - 60) / 2) - 15
        let layout = view.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 50, left: 30, bottom: 80, right: 30)
        return view
    }()
    
    // MARK: - Properties
    var presenter: FavoriteViewPresenterProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .appMain
        
        title = "Favorite"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .appMain
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        view.addSubview(collectionView)
    }
}

extension FavoriteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.post?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.reuseId,
                                                      for: indexPath) as! FavoriteCell
        if let item = presenter.post?[indexPath.item] {
            cell.configureCell(item: item)
        }
        return cell
    }
    
    
}

extension FavoriteView: UICollectionViewDelegate {
    
}

extension FavoriteView: FavoriteViewProtocol {
    func showPosts() {
        collectionView.reloadData()
    }
}
