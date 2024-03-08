//
//  ReliableDeviceViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 03/03/24.
//

import UIKit

final class ReliableDeviceViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let labeL = UILabel()
    private let cardView = UIView()
    private let VersionLabel = UILabel()
    private let phoneLabel = UILabel()
    private let royxat = UILabel()
    private let ilabel = UILabel()
    private let timeLabel = UILabel()
    private let button = UIButton(type: .system)
    private let deviceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        createNavigation()
        setTitleLabel()
        createView()
        createButton()
        titleCreate()
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
        titleLabel.text = "Ishonchli qurilmalar"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setTitleLabel() {
        view.addSubview(labeL)
        labeL.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labeL.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            labeL.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            labeL.heightAnchor.constraint(equalToConstant: 20)
        ])
        labeL.text = "Joriy qurilma"
        labeL.textColor = .black
        labeL.font = .systemFont(ofSize: 16,weight: .bold)
    }
    
    private func createView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.topAnchor.constraint(equalTo: labeL.bottomAnchor,constant: 15),
            cardView.heightAnchor.constraint(equalToConstant: 100),
            cardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = .white
        
        cardView.addSubview(VersionLabel)
        VersionLabel.frame = CGRect(x: 15, y: 10, width: 50, height: 20)
        VersionLabel.text = "1.0.60"
        VersionLabel.font = .systemFont(ofSize: 16,weight: .bold)
        
        cardView.addSubview(phoneLabel)
        phoneLabel.frame = CGRect(x: 15, y: 35, width: 70, height: 20)
        phoneLabel.text = "Redmi 8"
        phoneLabel.textColor = .gray
        
        cardView.addSubview(royxat)
        royxat.frame = CGRect(x: 15, y: 58, width: 300, height: 20)
        royxat.text = "Royxatga olingan:14.01.2024"
        royxat.textColor = .gray
        
        cardView.addSubview(ilabel)
        ilabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ilabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -15),
            ilabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            ilabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        ilabel.text = "Ishonchli emas"
        ilabel.textColor = .gray
        
        cardView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            timeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        timeLabel.text = "18:40:58, 14.01.2024"
        timeLabel.textColor = .gray
    }
    
    private func createButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 80)
        ])
        button.setTitle("Ishonchli qurilmaga aylantiring", for: .normal)
        button.backgroundColor = .appColor.primary
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
    }
    
    private func titleCreate() {
        view.addSubview(deviceLabel)
        deviceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deviceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            deviceLabel.heightAnchor.constraint(equalToConstant: 30),
            deviceLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20)
        ])
        deviceLabel.text = "Boshqa qurilmalar"
        deviceLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
}


extension ReliableDeviceViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        picker.dismiss(animated: true,completion: nil)
    }
}
