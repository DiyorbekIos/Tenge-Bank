//
//  PaymentCardsCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit
 
enum PaymentCardsType: Int {
    case card
    case transfer
    case payment
    case market
    case exchange
    case unnown
    case qr
    case history
    
    func getTitle() -> String {
        switch self {
        case .card: return "Mening Kartalarm"
        case .transfer: return "Otkazmalar"
        case .payment: return "To'lov"
        case .market: return "Tenge Market"
        case .exchange: return "Valyuta ayriboshlash"
        case .unnown: return "Kreditlar"
        case .qr: return "Qr to'lov"
        case .history: return "Mening arizalarim"
        }
    }
        
        func getImage() -> String {
            
            switch self {
            case .card: return "creditcard"
            case .transfer: return "arrow.left.arrow.right"
            case .payment: return "archivebox"
            case .market: return "cart.fill"
            case .exchange: return "arrow.triangle.2.circlepath.circle"
            case .unnown: return "bag"
            case .qr: return "arrow.triangle.2.circlepath.circle"
            case .history: return "doc.plaintext.fill"
            }
        }
    }
    
    final class PaymentCardsCell: UICollectionViewCell {
        
        private let imageView = UIImageView()
        private let title = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 10
            
            contentView.addSubview(imageView)
            imageView.layer.cornerRadius = 8
            imageView.layer.borderWidth = 0.4
            imageView.tintColor = .appColor.primary
            imageView.layer.borderColor = UIColor.systemGray4.cgColor
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: -5).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            // Assuming you have an instance of UIImageView called "imageView"
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
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5).isActive = true
            title.numberOfLines = 2
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        func prepare(type: PaymentCardsType) {
            imageView.image = UIImage(systemName: type.getImage())
            title.text = type.getTitle()
        }
    }

