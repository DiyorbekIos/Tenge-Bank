//
//  MessageViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 16/02/24.
//

import UIKit

final class MessageViewController :UIViewController {
    
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.backgroundColor = .white
        
        title = "Xabarnoma"
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive =  true
        button.setTitle("Hammasini o'qilgan deb belgilang", for: .normal)
        button.tintColor = .appColor.primary
        
    }
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

