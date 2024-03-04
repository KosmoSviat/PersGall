//
//  FavoriteViewPresenter.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 4.03.2024.
//

import UIKit

protocol FavoriteViewPresenterProtocol: AnyObject {
    var post: [PostItem]? { get set }
    func getPosts()
    init(view: FavoriteViewProtocol)
}

class FavoriteViewPresenter: FavoriteViewPresenterProtocol {
    
    // MARK: - Properties
    private weak var view: FavoriteViewProtocol?
    var post: [PostItem]?
    
    // MARK: - Methods
    func getPosts() {
        self.post = PostItem.getMockItems()
        self.view?.showPosts()
    }
    
    // MARK: - Init
    required init(view: FavoriteViewProtocol) {
        self.view = view
        getPosts()
    }
    
    
}
