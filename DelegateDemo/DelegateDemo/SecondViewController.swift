//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by Selman Adanir on 24.08.2023.
//

import UIKit

protocol ChangeBackgroundColorDelegate: AnyObject {
    func changeBackgroundColor()
    func goToFirstVC()
    func changeButtonTitle(text: String)
}

class SecondViewController: UIViewController {
    
    // MARK: - Views
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [goBackButton,
                                                  changeTitleButton,
                                                  changeBackgroundColorButton])
        view.spacing = 16
        view.distribution = .fill
        view.axis = .vertical
        return view
    }()

    private lazy var goBackButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.backgroundColor = .black
        view.setTitle("Just Go Back", for: .normal)
        view.addTarget(self, action: #selector(didGoBackButton) , for: .touchUpInside)
        return view
    }()
    
    private lazy var changeTitleButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.backgroundColor = .black
        view.setTitle("Go Back And Change Button Title", for: .normal)
        view.addTarget(self, action: #selector(didTappedChangeTitleButton) , for: .touchUpInside)
        return view
    }()
    
    private lazy var changeBackgroundColorButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.backgroundColor = .black
        view.setTitle("Go Back And Change Background Color", for: .normal)
        view.addTarget(self, action: #selector(didTappedChangeBackgroundColorButton) , for: .touchUpInside)
        return view
    }()
    
    // MARK: - Internal Property
    weak var delegate: ChangeBackgroundColorDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Private Method
    private func setUI() {
        view.backgroundColor = .red
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func didGoBackButton(){
        delegate?.goToFirstVC()
    }
    
    @objc private func didTappedChangeTitleButton(){
        delegate?.goToFirstVC()
        delegate?.changeBackgroundColor()
    }
    
    @objc private func didTappedChangeBackgroundColorButton(){
        delegate?.goToFirstVC()
        delegate?.changeButtonTitle(text: "Changed Name of Button")
    }
}
