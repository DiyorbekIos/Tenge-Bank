//
//  WhereViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 25/02/24.
//

import UIKit


final class WhereViewController:UIViewController {
    
    
    private let titleLabel = UILabel()
    private let addCardButton = UIButton(type: .system)
    private let plus = UIButton(type: .system)
    private let card1View = UIView()
    private let humoImage = UIImageView()
    private let humoLabel = UILabel()
    private let humoLabel2 = UILabel()
    private let humoLabel3 = UILabel()
    private let card2View = UIView()
    private let masterCardImage = UIImageView()
    private let cardLabel = UILabel()
    private let cardLabel2 = UILabel()
    private let cardLabel3 = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        createButton()
        createCard1view()
        createCard2view()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func createNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "x.circle"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        
        navigationItem.titleView = titleLabel
        titleLabel.text = "Qayerdan"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .center
        
    }
    @objc private func leftButtonTapped() {
        self.dismiss(animated: true)
    }
    
    
    private func createButton() {
        view.addSubview(addCardButton)
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addCardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addCardButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            addCardButton.heightAnchor.constraint(equalToConstant: 50),
            addCardButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        addCardButton.layer.cornerRadius = 8
        addCardButton.layer.borderWidth = 1
        addCardButton.layer.borderColor = UIColor.appColor.primary.cgColor
        addCardButton.contentHorizontalAlignment = .left
        addCardButton.setTitle("Karta qo'shish", for: .normal)
        addCardButton.setTitleColor(.appColor.primary, for: .normal)
        addCardButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        addCardButton.addTarget(self, action: #selector(addCardButtonTapped), for: .touchUpInside)
        
        addCardButton.addSubview(plus)
        plus.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        plus.tintColor = .appColor.primary
        plus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plus.topAnchor.constraint(equalTo: addCardButton.topAnchor, constant: 10),
            plus.bottomAnchor.constraint(equalTo: addCardButton.bottomAnchor,constant: -10),
            plus.trailingAnchor.constraint(equalTo: addCardButton.trailingAnchor, constant: -15)
        ])
        let scaleDownTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        plus.transform = scaleDownTransform
        plus.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)

    }
    
    private func createCard1view() {
        view.addSubview(card1View)
        card1View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card1View.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card1View.topAnchor.constraint(equalTo: addCardButton.bottomAnchor, constant: 50),
            card1View.heightAnchor.constraint(equalToConstant: 60),
            card1View.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        card1View.backgroundColor = .white
       
        card1View.addSubview(humoImage)
        humoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humoImage.leadingAnchor.constraint(equalTo: card1View.leadingAnchor,constant: 10),
            humoImage.topAnchor.constraint(equalTo: card1View.topAnchor, constant: 10),
            humoImage.bottomAnchor.constraint(equalTo: card1View.bottomAnchor, constant: -10),
            humoImage.widthAnchor.constraint(equalToConstant: 40)
        ])
        humoImage.layer.cornerRadius = 5
        humoImage.layer.borderWidth = 2
        humoImage.layer.borderColor = UIColor.systemGray6.cgColor
        humoImage.image = UIImage(named: "Humo")
        
        card1View.addSubview(humoLabel)
        humoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humoLabel.leadingAnchor.constraint(equalTo: humoImage.trailingAnchor, constant: 10),
            humoLabel.topAnchor.constraint(equalTo: card1View.topAnchor, constant: 10),
            humoLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        humoLabel.text = "Tenge Humo Virtual"
        humoLabel.textColor = .black
        
        card1View.addSubview(humoLabel2)
        humoLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humoLabel2.trailingAnchor.constraint(equalTo: card1View.trailingAnchor, constant: -15),
            humoLabel2.topAnchor.constraint(equalTo: card1View.topAnchor,constant: 10),
            humoLabel2.heightAnchor.constraint(equalToConstant:  20)
        ])
        humoLabel2.text = "0.oo uzs"
        humoLabel2.textColor = .black
        
        card1View.addSubview(humoLabel3)
        humoLabel3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humoLabel3.leadingAnchor.constraint(equalTo: humoImage.trailingAnchor, constant: 15),
            humoLabel3.heightAnchor.constraint(equalToConstant:  15),
            humoLabel3.bottomAnchor.constraint(equalTo: card1View.bottomAnchor, constant: -10)
        ])
        humoLabel3.text = ".....7467"
        humoLabel3.textColor = .gray
        
    }
    
    
    private func createCard2view() {
        view.addSubview(card2View)
        card2View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card2View.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card2View.topAnchor.constraint(equalTo: card1View.bottomAnchor, constant: 15),
            card2View.heightAnchor.constraint(equalToConstant: 60),
            card2View.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        card2View.backgroundColor = .white
       
        card2View.addSubview(masterCardImage)
        masterCardImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            masterCardImage.leadingAnchor.constraint(equalTo: card2View.leadingAnchor,constant: 10),
            masterCardImage.topAnchor.constraint(equalTo: card2View.topAnchor, constant: 10),
            masterCardImage.bottomAnchor.constraint(equalTo: card2View.bottomAnchor, constant: -10),
            masterCardImage.widthAnchor.constraint(equalToConstant: 40)
        ])
        masterCardImage.layer.cornerRadius = 5
        masterCardImage.layer.borderWidth = 2
        masterCardImage.layer.borderColor = UIColor.systemGray6.cgColor
        masterCardImage.image = UIImage(named: "Mastercard")
        
        card2View.addSubview(cardLabel)
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: masterCardImage.trailingAnchor, constant: 10),
            cardLabel.topAnchor.constraint(equalTo: card2View.topAnchor, constant: 10),
            cardLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        cardLabel.text = "Tenge bank"
        cardLabel.textColor = .black
        
        card2View.addSubview(cardLabel2)
        cardLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel2.trailingAnchor.constraint(equalTo: card2View.trailingAnchor, constant: -15),
            cardLabel2.topAnchor.constraint(equalTo: card2View.topAnchor,constant: 10),
            cardLabel2.heightAnchor.constraint(equalToConstant:  20)
        ])
        cardLabel2.text = "0.oo uzs"
        cardLabel2.textColor = .black
        
        card2View.addSubview(cardLabel3)
        cardLabel3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel3.leadingAnchor.constraint(equalTo: masterCardImage.trailingAnchor, constant: 15),
            cardLabel3.heightAnchor.constraint(equalToConstant:  15),
            cardLabel3.bottomAnchor.constraint(equalTo: card2View.bottomAnchor, constant: -10)
        ])
        cardLabel3.text = ".....1475"
        cardLabel3.textColor = .gray
        
    }
    
    @objc func addCardButtonTapped() {
        navigationController?.pushViewController(AddCardViewController(), animated: true)
    }
    
    @objc func plusTapped() {
        navigationController?.pushViewController(AddCardViewController(), animated: true)
    }
    
    
}
