//
//  O'tkazmalar.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 21/02/24.
//

import UIKit

final class OtkazmalarViewController:UIViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNavigation()
    }
    private func createNavigation() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.titleView = titleLabel
        titleLabel.text = "O'tkazmalar"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .left
        
        
    }
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
