//
//  SecurityCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 03/03/24.
//

import UIKit

enum SecurityType:Int {
    case qurilma
    case parol
    case pinKod
    case Ruxsat
    case number
    
    func getTitle() -> String {
        switch self {
        case .qurilma:return "Ishonchli qurilmalar"
        case .parol:  return "Parolni o'zgartirish"
        case .pinKod: return "PIN - kodni o'zgartirish"
        case .Ruxsat: return "Ruxsat Touch/Face ID"
        case .number: return "Telefon raqamini o'zgartirish"
        }
    }
    
    func getImage() -> String{
        switch self {
        case .qurilma: "iphone.sizes"
        case .parol:   "lock"
        case .pinKod:  "poweroutlet.type.n.square"
        case .Ruxsat:  "touchid"
        case .number:  "ipodtouch"
        }
    }
}

final class SecurityCell:UITableViewCell {
    
     let  button = UIButton()
     let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) 
        setImage()
        setTitle()
    }
    private func setImage() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30)
        ])
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.backgroundColor = .white
        button.tintColor = .appColor.primary
        let scaleDownTransform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        button.transform = scaleDownTransform
        
    }
    private func setTitle() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            title.heightAnchor.constraint(equalToConstant: 20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            title.widthAnchor.constraint(equalToConstant: 250 )
        ])
        title.numberOfLines = 2
        title.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(type: SecurityType) {
        button.setImage(UIImage(systemName: type.getImage()), for:.normal)
        title.text = type.getTitle()
    }
}
