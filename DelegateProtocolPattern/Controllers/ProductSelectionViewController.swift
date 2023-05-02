//
//  ProductSelectionViewController.swift
//  DelegateProtocolPattern
//
//  Created by Buğra Özuğurlu on 2.05.2023.
//
import UIKit
import SnapKit

protocol ProductSelectionDelegate {
    func didSelectProduct(name:String, imageName: String)
}
class ProductSelectionViewController: UIViewController {
    // MARK: - Properties
    var delegate: ProductSelectionDelegate?
    
    private let productStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        return stackView
    }()
    private lazy var iphoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("iPhone", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(iphoneButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var macbookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Macbook", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(macbookButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var ipadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("iPad", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(ipadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        stackViewSetup()
    }
    // MARK: - Function
    
}
// MARK: - Extensions
extension ProductSelectionViewController {
    private func configure() {
        view.backgroundColor = .label
        view.addSubview(productStackView)
    }
    private func stackViewSetup() {
        [iphoneButton,macbookButton,ipadButton].forEach { buttons in
            productStackView.addArrangedSubview(buttons)
        }
        productStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.left.right.equalToSuperview().inset(40)
        }
    }
}
// MARK: - Selectors:
extension ProductSelectionViewController {
    @objc private func iphoneButtonTapped() {
        delegate?.didSelectProduct(name: "iPhone 14 Pro Max", imageName: "iphone")
        dismiss(animated: true)
    }
    @objc private func macbookButtonTapped() {
        delegate?.didSelectProduct(name: "Macbook Pro", imageName: "macbook")
        dismiss(animated: true)
        
    }
    @objc private func ipadButtonTapped() {
        delegate?.didSelectProduct(name: "iPad Pro", imageName: "ipad")
        dismiss(animated: true)
    }
}
