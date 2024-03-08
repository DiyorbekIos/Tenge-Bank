//
//  ChangeNumberViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

final class ChangeNumberViewController:UIViewController {
    
    private let vieW = UIView()
    private let textField = UITextField()
    private let label = UILabel()
    private let imageView = UIImageView()
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgb(r: 55, g: 126, b: 85)
        self.tabBarController?.tabBar.isHidden = true
        setTextfield()
        setButton()
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
        
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setTextfield() {
        
        view.addSubview(vieW)
        vieW.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vieW.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            vieW.topAnchor.constraint(equalTo: view.centerYAnchor,constant: 40),
            vieW.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            vieW.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        vieW.layer.cornerRadius = 10
        vieW.layer.borderWidth = 2
        vieW.layer.borderColor = UIColor.white.cgColor
        
        vieW.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: vieW.leadingAnchor, constant: 15),
            imageView.centerYAnchor.constraint(equalTo: vieW.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        imageView.image = UIImage(systemName: "phone")
        imageView.tintColor = .white
        
        vieW.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        label.centerYAnchor.constraint(equalTo: vieW.centerYAnchor).isActive = true
        label.text = "+998"
        label.textColor = .white
        
        vieW.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: vieW.topAnchor,constant:0),
            textField.bottomAnchor.constraint(equalTo: vieW.bottomAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: vieW.trailingAnchor, constant: 0)
        ])
        textField.keyboardType = .numberPad
        textField.textColor = .white
    }
    
    private func setButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: vieW.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.setTitle("Keyingi", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.appColor.primary, for: .normal)
        button.backgroundColor = .white
    }
   
}
