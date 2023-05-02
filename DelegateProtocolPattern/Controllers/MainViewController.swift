//
//  MainViewController.swift
//  DelegateProtocolPattern
//
//  Created by Buğra Özuğurlu on 2.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
   
    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        return stackView
    }()
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apple")
        return imageView
    }()
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Favori Apple cihazin hangisi ?"
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    private lazy var productSelectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ürün seç", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(productSelectionButtonTapped), for: .touchUpInside)
        return button
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        stackViewSetup()
    }
}
// MARK: - Helpers:
extension MainViewController {
    private func configure() {
        view.backgroundColor = .label
        view.addSubview(mainStackView)
    }
    private func stackViewSetup() {
        [productImageView,productNameLabel,productSelectionButton].forEach { views in
            mainStackView.addArrangedSubview(views)
        }
        mainStackView.setCustomSpacing(150, after: productNameLabel)
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        productImageView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
        }
    }
}
extension MainViewController: ProductSelectionDelegate {
    func didSelectProduct(name: String, imageName: String) {
        productNameLabel.text = name
        productImageView.image = UIImage(named: imageName)
    }
    
    
    
}
// MARK: - Selectors:
extension MainViewController {
    @objc private func productSelectionButtonTapped() {
        let destinationVC = ProductSelectionViewController()
        destinationVC.delegate = self
        
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }
}
