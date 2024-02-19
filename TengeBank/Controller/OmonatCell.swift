//
//  OmonatCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 15/02/24.
//

import UIKit

final class OmonatCell:UICollectionViewCell {
    
    private let titleLabel = UILabel()
    let imageView = UIImageView()
    private let label = UILabel()
    let  button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        titleLabel.text = "Omonatlar"
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.heightAnchor.constraint(equalToConstant: 80),
            label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            label.widthAnchor.constraint(equalToConstant: 150)
        ])
        label.text = "Yillik 23% gacha qulay shartlar asosida depozitlar"
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 17)
        label.font = .boldSystemFont(ofSize: 17)
        
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 180),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 55)
        ])
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGray6
        button.setTitleColor(.appColor.primary, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
