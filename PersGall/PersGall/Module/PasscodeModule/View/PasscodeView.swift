//
//  ViewController.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 15.02.2024.
//

import UIKit

protocol PasscodeViewProtocol: AnyObject {
    func passcodeState(state: PasscodeState)
    func enterCode(code: [Int])
}

class PasscodeView: UIViewController {
    // MARK: Properties
    var passcodePresenter: PasscodePresenterProtocol!
    private let numberButtons: [ [Int] ] = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [0]]
    
    // MARK: - View's
    private lazy var passcodeTittle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var keyboardStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    private lazy var codeStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 20
        return stack
    }()
    
    private lazy var deleteButton: UIButton = {
        var button = UIButton(primaryAction: deleteCodeAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "delete.left"), for: .normal)
        button.tintColor = .white
        button.widthAnchor.constraint(equalToConstant: 36).isActive = true
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return button
    }()
    
    // MARK: - Action's
    private lazy var enterCodeAction = UIAction { [weak self] sender in
        guard let self, let sender = sender.sender as? UIButton else { return }
        self.passcodePresenter.enterPasscode(number: sender.tag)
    }
    
    private lazy var deleteCodeAction = UIAction { [weak self] sender in
        guard let self, let sender = sender.sender as? UIButton else { return }
        self.passcodePresenter.removeLastItemInPasscode()
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .appMain
        view.addSubviews([passcodeTittle, keyboardStack, codeStack, deleteButton])
        
        numberButtons.forEach {
            let buttonLine = setHorizontalNumStack(range: $0)
            keyboardStack.addArrangedSubview(buttonLine)
        }
        
        (11...14).forEach {
            let view = getCodeView(tag: $0)
            codeStack.addArrangedSubview(view)
        }
        
        setupConstraints()
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // PasscodeTittle
            passcodeTittle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passcodeTittle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passcodeTittle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            passcodeTittle.heightAnchor.constraint(equalToConstant: 50),
            
            //CodeStack
            codeStack.topAnchor.constraint(equalTo: passcodeTittle.bottomAnchor, constant: 50),
            codeStack.widthAnchor.constraint(equalToConstant: 140),
            codeStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // KeyboardStack
            keyboardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            keyboardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            keyboardStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            
            // DeleteButton
            deleteButton.rightAnchor.constraint(equalTo: keyboardStack.rightAnchor, constant: -25),
            deleteButton.bottomAnchor.constraint(equalTo: keyboardStack.bottomAnchor, constant: -25)
        ])
    }
}

// MARK: - Extension's
extension PasscodeView {
    private func getHorizontalNumStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 50
        return stack
    }
    
    private func setHorizontalNumStack(range: [Int]) -> UIStackView {
        let stack = getHorizontalNumStack()
        range.forEach {
            let numButton = UIButton(primaryAction: enterCodeAction)
            numButton.tag = $0
            numButton.setTitle("\($0)", for: .normal)
            numButton.setTitleColor(.white, for: .normal)
            numButton.titleLabel?.font = .systemFont(ofSize: 60, weight: .light)
            numButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            stack.addArrangedSubview(numButton)
        }
        return stack
    }
    
    private func getCodeView(tag: Int) -> UIView {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.tag = tag
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }
}

extension PasscodeView: PasscodeViewProtocol {
    func passcodeState(state: PasscodeState) {
        passcodeTittle.text = state.getPasscodeLabel()
    }
    
    func enterCode(code: [Int]) {
        let tag = code.count + 10
        (tag...14).forEach {
            view.viewWithTag($0)?.backgroundColor = .none
        }
        
        view.viewWithTag(tag)?.backgroundColor = .white
    }
}
