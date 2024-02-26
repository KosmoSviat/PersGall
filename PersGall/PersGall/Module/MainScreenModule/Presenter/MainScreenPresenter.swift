//
//  MainScreenPresenter.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

protocol MainScreenPresenterProtocol: AnyObject {
    init(view: MainScreenViewProtocol)
    var posts: [PostDate]? { get set }
    func getPosts()
}

class MainScreenPresenter {
    //MARK: - Properties
    weak var view: MainScreenViewProtocol?
    var posts: [PostDate]?
    // MARK: - Init
    required init(view: MainScreenViewProtocol) {
        self.view = view
        getPosts()
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    func getPosts() {
        self.posts = PostDate.getMockData()
        view?.showPosts()
    }
}
