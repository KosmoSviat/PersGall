//
//  KeychainManager.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 19.02.2024.
//

import Foundation
import KeychainAccess

protocol KeychainManagerProtocol: AnyObject {
    func save(key: String, value: String)
    func load(key: String) -> Result<String, Error>
}

class KeychainManager: KeychainManagerProtocol {
    // MARK: - Properties
    private let keychain = Keychain(service: "PASSCODE")
    
    // MARK: - Methods
    func save(key: String, value: String) {
        keychain[key] = value
    }
    
    func load(key: String) -> Result<String, Error> {
        do {
            let passcode = try keychain.getString(key) ?? ""
            return .success(passcode)
        } catch {
            return .failure(error)
        }
    }
}

enum KeychainKeys: String {
    case passcode = "passcode1"
}
