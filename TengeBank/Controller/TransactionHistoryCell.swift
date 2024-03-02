//
//  TransactionHistoryCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit

enum TransactionHistoryType {
    case batafsil
}

protocol TransactionHistoryDelegate: AnyObject {
    func didPressedMore(_ type: TransactionHistoryType)
}

final class TransactionHistoryCell:UICollectionViewCell {
    
    
    var nmadrPressed: ((TransactionHistoryType) -> ())?
    
    weak var delegate: TransactionHistoryDelegate?
    
    var type: TransactionHistoryType = .batafsil
    
     
    private let label = UILabel()
     let button = UIButton(type: .system)

    
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

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
