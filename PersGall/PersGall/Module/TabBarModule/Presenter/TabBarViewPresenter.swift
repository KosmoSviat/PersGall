//
//  TabBarViewPresenter.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
    func buildTabBar()
}

class TabBarViewPresenter {
    // MARK: - Properties
    weak var view: TabBarViewProtocol?

    // MARK: - Init
    required init(view: TabBarViewProtocol) {
        self.view = view
        self.buildTabBar()
    }
    
    // MARK: - Methods
}

extension TabBarViewPresenter: TabBarViewPresenterProtocol {
    func buildTabBar() {
        let mainScreen = Builder.createMainController()
        let cameraScreen = Builder.createCameraController()
        let favoriteScreen = Builder.createFavoriteController()
        self.view?.setControllers(controllers: [mainScreen, cameraScreen, favoriteScreen])
    }
}
