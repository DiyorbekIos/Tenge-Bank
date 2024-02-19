//
//  StoryCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit
enum StoryType :Int {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    func getImage() ->String {
        switch self {
            
        case .one: return "image1"
        case .two: return "image2"
        case .three: return "image3"
        case .four: return "image4"
        case .five: return "image5"
        case .six: return "image6"
        case .seven: return "image7"
        case .eight: return  "image8"
        }
    }
}

final class StoryCell:UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(type: StoryType) {
        imageView.image = UIImage(named: type.getImage())
    }
}
