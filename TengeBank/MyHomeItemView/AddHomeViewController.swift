//
//  AddHomeViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 27/02/24.
//

import UIKit

final class AddHomeViewController:UIViewController {
    
    private let imageView = UIImageView()
    private let label = UILabel()
    private let label2 = UILabel()
    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgb(r: 247, g: 247, b: 247)
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        setImage()
        setLabels()
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
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setImage() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 340),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60)
        ])
        imageView.image = UIImage(named: "AddHome")
    }
    
    private func setLabels() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor .constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 80)
        ])
        label.text = "Turar joyingizni qo'shing"
        label.font = .systemFont(ofSize: 28)
        label.textAlignment = .center
        
        
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            label2.heightAnchor.constraint(equalToConstant:  50),
            label2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 80)
        ])
        label2.text = "Barcha kommunal xizmatlar uchun  qulay va navbatsiz to'lang"
        label2.textColor = .gray
        label2.font = .systemFont(ofSize: 16)
        label2.textAlignment = .center
        label2.numberOfLines =  2
    }
    
    private func createButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        button.setTitle("Qo'shish", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .appColor.primary
        button.layer.cornerRadius = 8
        
    }
}

