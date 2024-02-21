//
//  OnlineMikroqarzLifeCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 21/02/24.
//

import  UIKit

final class OnlineMikroqarzCell:UICollectionViewCell {
    
    private let openCardsTitle = UILabel()
    private let imageView = UIImageView()
    private let  label1 = UILabel()
    private let  label2 = UILabel()
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
        openCardsTitle.text = "Kredit olish"
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
        imageView.image = UIImage(named: "Kredit1")
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
        label1.text = "Online mikroqarz"
        label1.font = .systemFont(ofSize: 23)
        
        contentView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label2.heightAnchor.constraint(equalToConstant: 60),
            label2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            label2.widthAnchor.constraint(equalToConstant: 200)
        ])
        label2.text = "Garov va kalitlarsiz,katta xaridlar uchun!"
        label2.font = .systemFont(ofSize: 13)
        label2.textColor = .gray
        label2.numberOfLines = 2
        
    }
    
    private func createButton () {
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            button.heightAnchor.constraint(equalToConstant: 35),
            button.widthAnchor.constraint(equalToConstant: 110)
        ])
        button.setTitle("KREDIT OLISH", for: .normal)
        button.setTitleColor(.appColor.primary, for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = .systemGray6
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
