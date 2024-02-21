//
//  cardsCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 19/02/24.
//

import UIKit

final class OpenCardsCell:UICollectionViewCell {
    
    private let openCardsTitle = UILabel()
    private let imageView = UIImageView()
    private let  label1 = UILabel()
    private let  label2 = UILabel()
    private let  label3 = UILabel()
    private let  button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createOpenCardsTitle()
        createImageView()
        createLabels()
        createButton ()
    }
    
    private func createOpenCardsTitle() {
        contentView.addSubview(openCardsTitle)
        openCardsTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openCardsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            openCardsTitle.heightAnchor.constraint(equalToConstant: 25),
            openCardsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
        openCardsTitle.text = "Omonat ochish"
        openCardsTitle.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private  func createImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)
        ])
        imageView.image = UIImage(named: "MasterCardDigital")
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.clipsToBounds = true
    }
    
    private func createLabels() {
        contentView.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label1.heightAnchor.constraint(equalToConstant: 30),
            label1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45)
        ])
        label1.text = "Foydali"
        label1.font = .systemFont(ofSize: 23)
        
        contentView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label2.heightAnchor.constraint(equalToConstant: 30),
            label2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            label2.widthAnchor.constraint(equalToConstant: 226.8299)
        ])
        label2.text = "UZS 23%"
        label2.font = .systemFont(ofSize: 14)
        label2.textColor = .gray
        
        contentView.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label3.heightAnchor.constraint(equalToConstant: 25),
            label3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        label3.text = "Batafsil ma'lumot"
        label3.font = .systemFont(ofSize:14)
        label3.textColor = .appColor.primary
    }
    
    private func createButton () {
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            button.heightAnchor.constraint(equalToConstant: 35),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
        button.setTitle("OCHISH", for: .normal)
        button.setTitleColor(.appColor.primary, for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = .systemGray6
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
