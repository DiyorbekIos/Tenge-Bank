//
//  KartaTableViewCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 15/02/24.
//

import UIKit

final class KartaTableViewCell:UITableViewCell {
    
    let label = UILabel()
    let image = UIImageView()
    let label2 = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 15),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60)
        ])
        label.font = .systemFont(ofSize:14)
        
        
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderWidth = 0.2
        image.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            image.topAnchor.constraint(equalTo: topAnchor, constant:20),
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        contentView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            label2.heightAnchor.constraint(equalToConstant: 20),
            label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60)
        ])
        label2.font = .systemFont(ofSize:12)
        label2.font = .boldSystemFont(ofSize: 18)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

