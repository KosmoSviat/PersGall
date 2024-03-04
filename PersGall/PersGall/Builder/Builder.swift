//
//  Builder.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 15.02.2024.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func getPasscodeController(passcodeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController
    static func createTabBarController() -> UIViewController
    static func createMainController() -> UIViewController
    static func createCameraController() -> UIViewController
    static func createFavoriteController() -> UIViewController
}

class Builder: BuilderProtocol {
    static func getPasscodeController(passcodeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController {
        let passcodeView = PasscodeView()
        let keychainManager = KeychainManager()
        let presenter = PasscodePresenter(view: passcodeView, passcodeState: passcodeState,
                                          keychainManager: keychainManager, sceneDelegate: sceneDelegate)
        passcodeView.passcodePresenter = presenter
        
        return passcodeView
    }
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarView()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        return tabBarView
    }
    
    static func createMainController() -> UIViewController {
        let mainView = MainScreenView()
        let presenter = MainScreenPresenter(view: mainView)
        mainView.presenter = presenter
        return mainView
    }
    
    static func createCameraController() -> UIViewController {
        let cameraView = CameraView()
        return cameraView
    }
    
    static func createFavoriteController() -> UIViewController {
        let favoriteView = FavoriteView()
        let presenter = FavoriteViewPresenter(view: favoriteView)
        favoriteView.presenter = presenter
        return UINavigationController(rootViewController: favoriteView)
    }
}
