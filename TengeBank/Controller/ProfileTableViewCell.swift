//
//  ProfileTableViewCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 17/02/24.
//

import UIKit

final class ProfileTableViewCell:UITableViewCell {
    
     let label = UILabel()
    let button = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
       addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
      
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            button.topAnchor.constraint(equalTo: topAnchor, constant:20),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 40)
        ])
        let scaleDownTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        button.transform = scaleDownTransform
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
