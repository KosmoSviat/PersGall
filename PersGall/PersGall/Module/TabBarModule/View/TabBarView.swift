//
//  TabBarView.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 20.02.2024.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(controllers: [UIViewController])
}

class TabBarView: UITabBarController {
    // MARK: GUI Variables
    private lazy var selectedItem = UIAction { [weak self] sender in
        guard let self, let sender = sender.sender as? UIButton else { return }
        self.selectedIndex = sender.tag
    }
    
    // MARK: - Properties
    var presenter: TabBarViewPresenterProtocol!
    private let tabs: [UIImage] = [UIImage(systemName: "house.fill") ?? UIImage.add,
                                   UIImage(systemName: "plus.circle.fill") ?? UIImage.add,
                                   UIImage(systemName: "heart.fill") ?? UIImage.add]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.isHidden = true
    }
    
    // MARK: - Methods
    private func setupUI() {
        tabs.enumerated().forEach{
            let offsets: [Double] = [-100, 0, 100]
            let tabButton = createTabBarButton(icon: $0.element, tag: $0.offset,
                                               offsetX: offsets[$0.offset], isBigButton: $0.offset == 1 ? true : false)
            
            view.addSubview(tabButton)
        }
    }
}

extension TabBarView: TabBarViewProtocol {
    func setControllers(controllers: [UIViewController]) {
        setViewControllers(controllers, animated: true)
    }
}

extension TabBarView {
    private func createTabBarButton(icon: UIImage, tag: Int, offsetX: Double,
                                    isBigButton: Bool = false) -> UIButton {
        let buttonSize = isBigButton ? 60.0 : 25.0
        let heightValue = view.frame.height - (buttonSize + (isBigButton ? 44 : 62))
        let button = UIButton(primaryAction: selectedItem)
        button.setBackgroundImage(icon, for: .normal)
        button.tintColor = .white
        button.tag = tag
        button.frame.size = CGSize(width: buttonSize, height: buttonSize)
        button.frame.origin = CGPoint(x: .zero, y: heightValue)
        button.center.x = view.center.x + offsetX
        return button
    }
}
