//
//  PublicCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

enum PublicType:Int {
    case tugilganlik
    case nikoh
    case ajrim
    case mulk
    case transport
    
    func getTitle() -> String {
        switch self {
        case .tugilganlik:return "Tug'ilganlik haqida ma'lumot"
        case .nikoh:  return "Nikoh tuzilganlik haqida ma'lumotnoma"
        case .ajrim: return "Ajrim haqida ma'lumot"
        case .mulk: return "Ko'chmas mulk haqida ma'lumot"
        case .transport: return "Avtatransport haqida ma'lumot"
        }
    }
    
    func getImage() -> String{
        switch self {
        case .tugilganlik: "stroller"
        case .nikoh:   "rectangle.on.rectangle.circle"
        case .ajrim:  "rectangle.on.rectangle"
        case .mulk:  "doc.plaintext.fill"
        case .transport:  "car"
        }
    }
}

final class PublicCell:UITableViewCell {
    
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
    
    func prepare(type: PublicType) {
        button.setImage(UIImage(systemName: type.getImage()), for:.normal)
        title.text = type.getTitle()
    }
}

