//
//  ChangePasswordViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 03/03/24.
//

import UIKit


final class ChangePasswordViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let paswordView = UIView()
    private let oldPasswordLabel = UILabel()
    private let textfield = UITextField()
    var showSecure = UIButton(type: .system)
    var isSecureTextEntry = true
    var isButtonSelected = true
    private let infoButton = UIButton()
    private let passwordLabel = UILabel()
    private let upperCase = UILabel()
    private let number = UILabel()
    private let sign = UILabel()
    private let paswordView2 = UIView()
    private let oldPasswordLabel2 = UILabel()
    private let textfield2 = UITextField()
    var showSecure2 = UIButton(type: .system)
    private let paswordView3 = UIView()
    private let oldPasswordLabel3 = UILabel()
    private let textfield3 = UITextField()
    var showSecure3 = UIButton(type: .system)
    
    private let  button = UIButton(type: .system)

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        setPasswordView()
        setLabels()
        setPasswordView2()
        setPasswordView3()
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
        titleLabel.text = "Parolni o'zgartirish"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
        
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
                                     
    
    private func setPasswordView() {
        view.addSubview(paswordView)
        paswordView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paswordView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            paswordView.heightAnchor.constraint(equalToConstant: 70),
            paswordView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        paswordView.backgroundColor = .white
        paswordView.layer.cornerRadius = 10
        
        paswordView.addSubview(oldPasswordLabel)
        oldPasswordLabel.frame = CGRect(x: 15, y: 10, width: 300, height: 20)
        oldPasswordLabel.text = "Oldingi parolni kiriting"
        oldPasswordLabel.textColor = .gray
        oldPasswordLabel.font = .systemFont(ofSize: 14)
        
       paswordView.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfield.leadingAnchor.constraint(equalTo: paswordView.leadingAnchor, constant: 10),
            textfield.trailingAnchor.constraint(equalTo: paswordView.trailingAnchor, constant: -5),
            textfield.heightAnchor.constraint(equalToConstant: 50),
            textfield.topAnchor.constraint(equalTo: paswordView.topAnchor, constant: 25)
        ])
        
        paswordView.addSubview(showSecure)
        showSecure.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showSecure.trailingAnchor.constraint(equalTo: textfield.trailingAnchor, constant: -5),
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
    
    private func setLabels() {
        view.addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            infoButton.topAnchor.constraint(equalTo: paswordView.bottomAnchor, constant: 20),
            infoButton.heightAnchor.constraint(equalToConstant: 20),
            infoButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.tintColor = .gray
        
        
        view.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: infoButton.trailingAnchor,constant: 5),
            passwordLabel.topAnchor.constraint(equalTo: paswordView.bottomAnchor, constant: 20),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        passwordLabel.text = "Parol quyidagilarni o'z ichiga olishi kerak:"
        passwordLabel.textColor = .gray
        
        view.addSubview(upperCase)
        upperCase.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperCase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            upperCase.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            upperCase.heightAnchor.constraint(equalToConstant: 15)
        ])
        upperCase.text = "Kamida bitta katta harf (A-Z"
        upperCase.textColor = .red
        
        
        view.addSubview(number)
        number.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            number.topAnchor.constraint(equalTo: upperCase.bottomAnchor, constant: 10),
            number.heightAnchor.constraint(equalToConstant: 15)
        ])
        number.text = "Kamida bitta raqam(0-9)"
        number.textColor = .red
        
        view.addSubview(sign)
        sign.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sign.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            sign.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 10),
            sign.heightAnchor.constraint(equalToConstant: 15)
        ])
        sign.text = "Kamida 8 ta belgi"
        sign.textColor = .red
        
        
    }
    
    private func setPasswordView2() {
        view.addSubview(paswordView2)
        paswordView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paswordView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paswordView2.topAnchor.constraint(equalTo: sign.bottomAnchor, constant: 20),
            paswordView2.heightAnchor.constraint(equalToConstant: 70),
            paswordView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        paswordView2.backgroundColor = .white
        paswordView2.layer.cornerRadius = 10
        
        paswordView2.addSubview(oldPasswordLabel2)
        oldPasswordLabel2.frame = CGRect(x: 15, y: 10, width: 300, height: 20)
        oldPasswordLabel2.text = "Yangi parolni kiriting"
        oldPasswordLabel2.textColor = .gray
        oldPasswordLabel2.font = .systemFont(ofSize: 14)
        
       paswordView2.addSubview(textfield2)
        textfield2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfield2.leadingAnchor.constraint(equalTo: paswordView2.leadingAnchor, constant: 10),
            textfield2.trailingAnchor.constraint(equalTo: paswordView2.trailingAnchor, constant: -5),
            textfield2.heightAnchor.constraint(equalToConstant: 50),
            textfield2.topAnchor.constraint(equalTo: paswordView2.topAnchor, constant: 25)
        ])
        
        paswordView2.addSubview(showSecure2)
        showSecure2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showSecure2.trailingAnchor.constraint(equalTo: textfield2.trailingAnchor, constant: -5),
            showSecure2.heightAnchor.constraint(equalToConstant: 25),
            showSecure2.centerYAnchor.constraint(equalTo: textfield2.centerYAnchor)
        ])
        showSecure2.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showSecure2.tintColor = .appColor.primary
        showSecure2.addTarget(self, action: #selector(showTapped2), for: .touchUpInside)
    }
    
    @objc func showTapped2( ) {
        isSecureTextEntry.toggle()
        textfield2.isSecureTextEntry = isSecureTextEntry
        isButtonSelected.toggle()
        
        if isButtonSelected {
            showSecure2.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            showSecure2.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
       
    }
    
    private func setPasswordView3() {
        view.addSubview(paswordView3)
        paswordView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paswordView3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paswordView3.topAnchor.constraint(equalTo: textfield2.bottomAnchor, constant: 10),
            paswordView3.heightAnchor.constraint(equalToConstant: 70),
            paswordView3.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        paswordView3.backgroundColor = .white
        paswordView3.layer.cornerRadius = 10
        
        paswordView3.addSubview(oldPasswordLabel3)
        oldPasswordLabel3.frame = CGRect(x: 15, y: 10, width: 300, height: 20)
        oldPasswordLabel3.text = "Yangi parolni kiriting"
        oldPasswordLabel3.textColor = .gray
        oldPasswordLabel3.font = .systemFont(ofSize: 14)
        
        paswordView3.addSubview(textfield3)
        textfield3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfield3.leadingAnchor.constraint(equalTo: paswordView3.leadingAnchor, constant: 10),
            textfield3.trailingAnchor.constraint(equalTo: paswordView3.trailingAnchor, constant: -5),
            textfield3.heightAnchor.constraint(equalToConstant: 50),
            textfield3.topAnchor.constraint(equalTo: paswordView3.topAnchor, constant: 25)
        ])
        
        paswordView3.addSubview(showSecure3)
        showSecure3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showSecure3.trailingAnchor.constraint(equalTo: textfield3.trailingAnchor, constant: -5),
            showSecure3.heightAnchor.constraint(equalToConstant: 25),
            showSecure3.centerYAnchor.constraint(equalTo: textfield3.centerYAnchor)
        ])
        showSecure3.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showSecure3.tintColor = .appColor.primary
        showSecure3.addTarget(self, action: #selector(showTapped3), for: .touchUpInside)
    }
    
    @objc func showTapped3( ) {
        isSecureTextEntry.toggle()
        textfield3.isSecureTextEntry = isSecureTextEntry
        isButtonSelected.toggle()
        
        if isButtonSelected {
            showSecure3.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            showSecure3.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
       
    }
    
    
    private func createButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: textfield3.bottomAnchor, constant:  200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        button.setTitle("Keyingi", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .appColor.primary
        button.layer.cornerRadius = 8
    }
}

