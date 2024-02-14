//
//  TransactionHistoryCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit

final class TransactionHistoryCell:UICollectionViewCell {
     
    private let label = UILabel()
    private let button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        ])
        label.text = "Tranzaksiyalar tarixi"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 20)
        
        contentView.addSubview(button)
        button.setTitle("Batafsil", for: .normal)
        button.setTitleColor(.appColor.primary, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        button.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
