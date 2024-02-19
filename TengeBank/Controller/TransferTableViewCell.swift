//
//  TransferTableViewCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 06/02/24.
//

import UIKit

final class TransferTableViewCell:UITableViewCell {
    
    let titleLabel = UILabel()
    let button  = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            titleLabel.widthAnchor.constraint(equalToConstant: 300 )
            
        ])
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray3.cgColor
        button.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            button.topAnchor.constraint(equalTo: topAnchor, constant:20),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 40)
        ])
        let scaleDownTransform = CGAffineTransform(scaleX: 1, y: 1)
        button.transform = scaleDownTransform
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

