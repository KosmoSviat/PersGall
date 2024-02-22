//
//  MainScreenPresenter.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

protocol MainScreenPresenterProtocol: AnyObject {
    init(view: MainScreenViewProtocol)
}

class MainScreenPresenter {
    //MARK: - Properties
    weak var view: MainScreenViewProtocol?
    
    // MARK: - Init
    required init(view: MainScreenViewProtocol) {
        self.view = view
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
}
