//
//  DeleteAkkauntViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 22/02/24.
//

import UIKit

final class DeleteAkkauntViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let label  = UILabel ()
    private let textfield = UITextField()
    var showSecure = UIButton(type: .system)
    var isSecureTextEntry = true
    var isButtonSelected = true
    private let  button = UIButton(type: .system)

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        setTitle()
        setTextFied()
        createButton()
        
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
        titleLabel.text = "Akkaunt o'chiruvi"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
        
        
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
                                     
    private func setTitle() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            label.heightAnchor.constraint(equalToConstant: 25)
        ])
        label.text = "Parolni kiriting"
        label.font = .systemFont(ofSize: 21)
    }
    
    private func setTextFied() {
        view.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textfield.heightAnchor.constraint(equalToConstant: 50),
            textfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25)
        ])
        textfield.layer.borderWidth = 2
        textfield.layer.borderColor = UIColor.appColor.primary.cgColor
        textfield.layer.cornerRadius = 8
        
        
        view.addSubview(showSecure)
        showSecure.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showSecure.trailingAnchor.constraint(equalTo: textfield.trailingAnchor, constant: -20),
            showSecure.heightAnchor.constraint(equalToConstant: 25),
            showSecure.centerYAnchor.constraint(equalTo: textfield.centerYAnchor)
        ])
        showSecure.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showSecure.tintColor = .appColor.primary
        showSecure.addTarget(self, action: #selector(showTapped), for: .touchUpInside)
        
        
    }
    
    
    @objc func showTapped( ) {
        isSecureTextEntry.toggle()
        textfield.isSecureTextEntry = isSecureTextEntry
        isButtonSelected.toggle()
        
        if isButtonSelected {
            showSecure.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            showSecure.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
       
    }
    
    private func createButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60)
        ])
        button.setTitle("Keyingi", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .appColor.primary
        button.layer.cornerRadius = 8
    }
}

