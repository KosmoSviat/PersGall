//
//  SceneDelegate.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 15.02.2024.
//

import UIKit

protocol SceneDelegateProtocol {
    func startMainScreen()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var window: UIWindow?
    private var keychainManager = KeychainManager()

    // MARK: - Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = Builder.createTabBarController()
        //Builder.getPasscodeController(passcodeState: checkIsSetPasscode(), sceneDelegate: self)
        window?.makeKeyAndVisible()
    }
    
    private func checkIsSetPasscode() -> PasscodeState {
        let keychainPasscodeResult = keychainManager.load(key: KeychainKeys.passcode.rawValue)
        switch keychainPasscodeResult {
        case .success(let code):
            return code.isEmpty ? .setNewPasscode : .inputPasscode
        case .failure:
            return .setNewPasscode
        }
    }
}

extension SceneDelegate: SceneDelegateProtocol {
    func startMainScreen() {
        self.window?.rootViewController = Builder.createTabBarController()
    }
    
    
}
