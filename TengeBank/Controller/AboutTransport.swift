//
//  AboutTransport.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

final class AboutTransport:UIViewController {
    
    private let titleLabel = UILabel()
    private let image = UIImageView()
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgb(r: 247, g: 247, b: 247)
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        setImage()
        setButton()
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
        titleLabel.text = "Avtotransport haqida ma'lumot"
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textAlignment = .left
        
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setImage(){
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -160)
        ])
        image.image = UIImage(named: "Transport")
    }
    
    private func setButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        button.setTitle("Ma'lumot olish", for: .normal)
        button.backgroundColor = .appColor.primary
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let alert = UIAlertController(title: "", message: "So'rovingizga mos keladigan ma'lumotlar topilmadi", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yopish", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


