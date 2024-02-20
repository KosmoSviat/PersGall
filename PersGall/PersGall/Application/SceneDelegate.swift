//
//  SceneDelegate.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 15.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var window: UIWindow?
    private var keychainManager = KeychainManager()

    // MARK: - Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = Builder.getPasscodeController(passcodeState: checkIsSetPasscode())
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

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

