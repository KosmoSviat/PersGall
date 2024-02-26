//
//  MainScreenView.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

protocol MainScreenViewProtocol: AnyObject {
    func showPosts()
}

class MainScreenView: UIViewController {
    // MARK: - GUI Variables
    private lazy var topMenuView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: menuViewHeight)
        view.backgroundColor = .appMain
        return view
    }()
    
    private lazy var menuAppName: UILabel = {
        let label = UILabel()
        label.text = "PersGall"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.frame = CGRect(x: 50, y: menuViewHeight - 40, width: view.bounds.width, height: 30)
        return label
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.bounds.width - 50, y: menuViewHeight - 35, width: 20, height: 20)
        button.setBackgroundImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        let layout = view.collectionViewLayout as! UICollectionViewFlowLayout
        let cellSizeValue = view.frame.width - 60
        layout.itemSize = CGSize(width: cellSizeValue, height: cellSizeValue)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 40, right: 0)
        
        view.contentInset.top = 120
        view.backgroundColor = .appMain
        view.dataSource = self
        view.delegate = self
        view.alwaysBounceVertical = true
        view.register(MainPostCell.self, forCellWithReuseIdentifier: MainPostCell.reuseID)
        view.register(MainPostHeader.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: MainPostHeader.reuseID)
        return view
    }()
    
    // MARK: - Properties
    var presenter: MainScreenPresenterProtocol!
    private var menuViewHeight = UIApplication.topSafeArea + 70
    private var topInsets: CGFloat = 0
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.addSubview(collectionView)
        view.addSubview(topMenuView)
        
        topInsets = collectionView.adjustedContentInset.top
        
        topMenuView.addSubviews([menuAppName, settingButton])
    }
}

extension MainScreenView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.presenter.posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.posts?[section].items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPostCell.reuseID,
                                                            for: indexPath) as? MainPostCell
        else { return UICollectionViewCell() }
        
        if let item = presenter.posts?[indexPath.section].items[indexPath.row] {
            cell.configureCell(item: item)
        }
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: MainPostHeader.reuseID,
                                                                     for: indexPath) as! MainPostHeader
        let stringHeader = presenter.posts?[indexPath.section].date.getDateDifference()
        header.setHeadertext(header: stringHeader)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width - 60, height: 40)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let menuTopPosition = scrollView.contentOffset.y + topInsets
        
        if menuTopPosition < 40, menuTopPosition > 0 {
            topMenuView.frame.origin.y = -menuTopPosition
            self.menuAppName.font = .systemFont(ofSize: 30 - menuTopPosition * 0.2, weight: .bold)
        }
    }
}

extension MainScreenView: MainScreenViewProtocol {
    func showPosts() {
        collectionView.reloadData()
    }
}
