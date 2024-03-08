//
//  ElectriCityCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

enum ElectriCityCellType:Int {
    case Qoraqalpogiston
    case Namangan
    case ToshkentSh
    case Fargona
    case Andijon
    case Navoiy
    case Sirdaryo
    case Surxondaryo
    case ToshkentVil
    case Samarqand
    case Jizzax
    case Qashqadaryo
    case Buxoro
    case Xorazm
    
    func getTitle() -> String {
        switch self {
            
        case .Qoraqalpogiston: return "Qoraqalpog'iston EE"
        case .Namangan:  return "Namangan EE"
        case .ToshkentSh: return "Toshkent sh. EE"
        case .Fargona:  return "Farg'ona EE"
        case .Andijon:         return "Andijon EE"
        case .Navoiy:          return "Navoiy EE"
        case .Sirdaryo:        return "Sirdaryo EE"
        case .Surxondaryo:     return "Surxondaryo EE"
        case .ToshkentVil:     return "Toshkent vil. EE"
        case .Samarqand:       return "Samaqrqand EE"
        case .Jizzax:          return "Jizzax EE"
        case .Qashqadaryo:     return "Qashqadaryo EE"
        case .Buxoro:          return "Buxoro EE"
        case .Xorazm:          return "Xorazm EE"
        }
    }
}

final class ElectriCityCell:UITableViewCell {
    
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
        button.setImage(UIImage(named: "ElectriCity"), for: .normal)
        
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
    
    func prepare(type: ElectriCityCellType) {
        title.text = type.getTitle()
    }
}
