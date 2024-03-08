//
//  InternetCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

enum InternetType:Int {
    case tps
    case sarkor
    case comnet
    case nano
    case free
    case simus
    case netco
    case spectr
    case dgt
    case tnet
    case sola
    case line
    case stark
    case koinot
    case unet
    case cityNet
    case gals
    case ars
    case silver
    case uzonline
    
    func getTitle() -> String {
        switch self {
        
        case .tps: return "TPS"
        case .sarkor: return "Sarkor - Telecom"
        case .comnet: return "Comnet Online"
        case .nano :return "Nano Online"
        case .free: return "Nano telecom"
        case .simus: return "Free Link"
        case .netco: return " NETCO "
        case .spectr: return "Spectr-It Internet"
        case .dgt: return " DGT "
        case .tnet: return "TNET "
        case .sola: return "SOLA "
        case .line: return "City LIne.uz"
        case .stark: return "STARK TV TELECOM "
        case .koinot: return "KoinotTV"
        case .unet: return "UNET"
        case .cityNet:return "CityNEt+"
        case .gals:return "Gals Telceom"
        case .ars: return "Ars - Infor"
        case .silver:return "Silver Telecom"
        case .uzonline: return "Uzonline"
        }
    }
    
    func getImage() -> String{
        switch self {
    
        case .tps: "Tps"
        case .sarkor:"Sarkor"
        case .comnet: "Comnet"
        case .nano: "Nano"
        case .free: "Free"
        case .simus: "Simus"
        case .netco: "Netco"
        case .spectr: "Spectr"
        case .dgt: "Dgt"
        case .tnet: "Tnet"
        case .sola: "Sola"
        case .line: "Line"
        case .stark: "Stark"
        case .koinot: "Koinot"
        case .unet: "Unet"
        case .cityNet: "Citynet"
        case .gals: "Gals"
        case .ars: "Ars"
        case .silver: "Silver"
        case .uzonline:"Uzonline"
        }
    }
}

final class InternetCell:UITableViewCell {
    
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
    
    func prepare(type: InternetType) {
        button.setImage(UIImage(named: type.getImage()), for:.normal)
        title.text = type.getTitle()
    }
}

