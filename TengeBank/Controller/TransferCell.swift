//
//  TransferCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit

final class TransferCell: UICollectionViewCell {
    
    private let label = UILabel()
    private let segmentedControl = UISegmentedControl()
    private let textField = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            label.widthAnchor.constraint(equalToConstant: 150),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
        label.text = "Tezkor o'tkazma"
        label.font = .boldSystemFont(ofSize: 20)
        label.font = .systemFont(ofSize: 18)
        
        
        contentView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            segmentedControl.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 135),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            segmentedControl.heightAnchor.constraint(equalToConstant: 60)
        ])
        segmentedControl.insertSegment(withTitle: "Karta raqami", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Telefon raqami", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .appColor.primary
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.placeholder = " 8600 1234 5678 1234"
        case 1:
            textField.placeholder = " +998"
        default:
            break
        }
        
        
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
       
        
        textField.layer.borderWidth = 5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        
        
       
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
