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
    var presenter: MainScreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainScreenView: MainScreenViewProtocol {
    func showPosts() {
        
    }
    
    
}
