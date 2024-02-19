//
//  PayViewControllerCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 14/02/24.
//
import UIKit

enum PayCardsType: Int {
    case phone
    case elektr
    case unknown
    case internet
    case xizmat
    case taxi
    case tv
    case category
    
    func getTitle() -> String {
        switch self {
        case .phone: return "Uyali aloqa"
        case .elektr: return "Elektr energiya"
        case .unknown: return "Kreditni to'lash"
        case .internet: return "Internet"
        case .xizmat: return "Davlat xizmatalari"
        case .taxi: return "Taxi"
        case .tv: return "Televideniya"
        case .category: return "Kategoriyalar"
        }
    }
    
    func getImage() -> String {
        switch self {
        case .phone: return "iphone.gen3"
        case .elektr: return "powerplug"
        case .unknown: return "rectangle"
        case .internet: return "antenna.radiowaves.left.and.right"
        case .xizmat: return "house"
        case .taxi: return "car"
        case .tv: return "tv"
        case .category: return "arrow.forward.square"
        }
    }
}

final class PayViewControllerCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.4
        imageView.tintColor = .appColor.primary
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor,constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let scaleDownFactor: CGFloat = 0.5
        // Adjust the scale factor as desired

        // Apply the scaling transformation
        imageView.transform = CGAffineTransform(scaleX: scaleDownFactor, y: scaleDownFactor)
        
        contentView.addSubview(title)
        title.font = .systemFont(ofSize: 12)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        title.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(type: PayCardsType) {
        imageView.image = UIImage(systemName: type.getImage())
        title.text = type.getTitle()
    }
}
