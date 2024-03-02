//
//  SelectCountViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 29/02/24.
//

import UIKit

final class SelectCountViewController:UIViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNavigation()
    }
    
    private func createNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "x.circle"),
            style: .done,
            target: self,
            action: #selector(rightButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        navigationItem.titleView = titleLabel
        titleLabel.text = "Hisobni tanlang"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    @objc private func rightButtonTapped() {
        self.dismiss(animated:  true)
    }
        
        
}
