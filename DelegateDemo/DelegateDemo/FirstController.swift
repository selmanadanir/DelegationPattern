//
//  ViewController.swift
//  DelegateDemo
//
//  Created by Selman Adanir on 24.08.2023.
//

import UIKit
import SnapKit

class FirstController: UIViewController {
    
    // MARK: - Views
    private lazy var button: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.backgroundColor = .black
        view.setTitle("Go to 2.VC", for: .normal)
        view.addTarget(self, action: #selector(didTapped) , for: .touchUpInside)
        return view
    }()
    
    // MARK: - Internal Property
    private var targetVC: SecondViewController?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTargetVC()
    }
    
    // MARK: - Private Method
    private func setUI() {
        view.addSubview(button)
        view.backgroundColor = .white
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(210)
            make.height.equalTo(80)
        }
    }
    
    private func setTargetVC() {
        targetVC = SecondViewController()
        targetVC?.delegate = self
    }
    
    // MARK: - Action
    @objc private func didTapped(){
        if let targetVC {
            navigationController?.pushViewController(targetVC, animated: true)
        }
    }
}

// MARK: - ChangeBackgroundColorDelegate
extension FirstController: ChangeBackgroundColorDelegate {
    func changeBackgroundColor() {
        view.backgroundColor = .green
    }
    
    func goToFirstVC() {
        navigationController?.popViewController(animated: true)
    }
    
    func changeButtonTitle(text: String) {
        button.setTitle(text, for: .normal)
    }
}
