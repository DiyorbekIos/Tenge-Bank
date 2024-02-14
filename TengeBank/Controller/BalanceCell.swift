//
//  BalanceCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit

final class BalanceCell:UICollectionViewCell {
    
    let imageView = UIImageView()
    private let label = UILabel()
    private let addCardButon = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 35),
        ])
        label.text = "0.00 UZS"
        
        
        addCardButon.setTitle("Add your card", for: .normal)
        addCardButon.setImage(UIImage(systemName: "plus"), for: .normal)
        contentView.addSubview(addCardButon)
        addCardButon.translatesAutoresizingMaskIntoConstraints = false
        addCardButon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addCardButon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addCardButon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addCardButon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addCardButon.isHidden = true
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCardMode() {
        addCardButon.isHidden = false
        label.isHidden = true
    }
}
