//
//  AboutUsViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 22/02/24.
//

import UIKit

final class AboutUsViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let imageView =  UIImageView()
    private let callLabel = UILabel()
    private let callButton = UIButton(type: .system)
    private let  label = UILabel()
    private let instagram = UIButton(type: .system)
    private let telegram = UIButton(type: .system)
    private let facebook = UIButton(type: .system)
    private let network = UIButton(type: .system)
    private let version = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgb(r: 247, g: 247, b: 247)
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        setImage()
        setCallLabel()
        setCallButton()
        setLabel()
        setSocilaNetwork ()
        setVersion()
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
        titleLabel.text = "Biz haqimizda"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
        
        
    }
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setImage() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        imageView.image = UIImage(named: "Tenge24")

    }
    
    private func  setCallLabel() {
        view.addSubview(callLabel)
        callLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            callLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            callLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        callLabel.text = "Aloqa markazi"
        callLabel.textColor = .gray
        callLabel.font = .systemFont(ofSize: 22 )
    }
    
    private func setCallButton() {
        view.addSubview(callButton)
        callButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            callButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callButton.topAnchor.constraint(equalTo: callLabel.bottomAnchor, constant: 15),
            callButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        callButton.setTitle("1245", for: .normal)
        callButton.setTitleColor(.black, for: .normal)
        callButton.setImage(UIImage(systemName: "phone.badge.waveform"), for: .normal)
        callButton.tintColor = .appColor.primary
        let scaleDownTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        callButton.transform = scaleDownTransform
    }
    
    private func setLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 50),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
        label.text = "Biz ijtimoiy tarmoqlarda"
        label.font = .systemFont(ofSize: 18)
    }
    
    private func setSocilaNetwork () {
        view.addSubview(instagram)
        instagram.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instagram.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            instagram.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            instagram.heightAnchor.constraint(equalToConstant: 40)
        ])
        instagram.setImage(UIImage(systemName: "circle.square"), for: .normal)
        instagram.tintColor = .appColor.primary
        
        view.addSubview(telegram)
        telegram.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            telegram.trailingAnchor.constraint(equalTo: instagram.trailingAnchor, constant: 100 ),
            telegram.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            telegram.heightAnchor.constraint(equalToConstant: 40)
        ])
        telegram.setImage(UIImage(systemName: "location"), for: .normal)
        telegram.tintColor = .appColor.primary
        
        view.addSubview(facebook)
        facebook.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            facebook.trailingAnchor.constraint(equalTo: telegram.trailingAnchor, constant: 100 ),
            facebook.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            facebook.heightAnchor.constraint(equalToConstant: 40)
        ])
        facebook.setImage(UIImage(systemName: "f.cursive.circle"), for: .normal)
        facebook.tintColor = .appColor.primary
        
        view.addSubview(network)
        network.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            network.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            network.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            network.heightAnchor.constraint(equalToConstant: 40)
        ])
        network.setImage(UIImage(systemName: "network.badge.shield.half.filled"), for: .normal)
        network.tintColor = .appColor.primary
    }
    
    private func setVersion() {
        view.addSubview(version)
        version.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            version.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            version.heightAnchor.constraint(equalToConstant: 30),
            version.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        version.text = "Версия: 1.0.62"
        version.textColor = .gray
    }
}
