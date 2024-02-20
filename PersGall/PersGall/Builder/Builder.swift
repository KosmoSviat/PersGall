//
//  Builder.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 15.02.2024.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func getPasscodeController(passcodeState: PasscodeState) -> UIViewController
}

class Builder: BuilderProtocol {
    static func getPasscodeController(passcodeState: PasscodeState) -> UIViewController {
        let passcodeView = PasscodeView()
        let keychainManager = KeychainManager()
        let presenter = PasscodePresenter(view: passcodeView, passcodeState: passcodeState, keychainManager: keychainManager)
        passcodeView.passcodePresenter = presenter
        
        return passcodeView
    }
}
