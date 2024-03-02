//
//  MyHomeswift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit

enum HomeCellType: Int {
    case home
    case loan
    case depozit
}

protocol HomeCellDelegate: AnyObject {
    func didPressedMore(_ type: HomeCellType)
}

final class MyHomeCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let label1 = UILabel()
    let label2 = UILabel()
    
    let button = UIButton(type: .system)
    
    var nmadrPressed: ((HomeCellType) -> ())?
    
    weak var delegate: HomeCellDelegate?
    
    var type: HomeCellType = .home
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label1.widthAnchor.constraint(equalToConstant: 200),
            label1.heightAnchor.constraint(equalToConstant: 20)
        ])
        label1.textColor = .white
        label1.font = .systemFont(ofSize: 20)
        
        
        contentView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            label2.widthAnchor.constraint(equalToConstant: 200),
            label2.heightAnchor.constraint(equalToConstant: 50)
        ])
        label2.textColor = .white
        label2.font = .systemFont(ofSize: 16)
        label2.numberOfLines = 2
        backgroundColor = .white
        layer.cornerRadius = 10
        createButton()
    }
    
    func createButton() {
        contentView.addSubview(button)
//        button.setTitle("Batafsil", for: .normal)
//        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        button.addTarget(self, action: #selector(morePressed), for: .touchUpInside)
    }
    
    func prepare(cellType: HomeCellType) {
        type = cellType
        switch cellType {
        case .home:
            imageView.image = UIImage(named: "MyHomeCellImage1")
            label1.text = "Mening uyim"
            label2.text = "Komunal to'lovlarni osonroq to'lang"
            button.setTitle("Batafsil", for: .normal)
            button.setTitleColor(.white, for: .normal)
            type = cellType
            
        case .loan:
            imageView.image = UIImage(named: "MyHomeCellImage2")
            label1.text = "Foydali mikroqarz"
            label2.text = "Qulay shartlarga ega tezkor onlayn mikroqarz, eng!"
            button.setTitle("Batafsil", for: .normal)
            button.setTitleColor(.white, for: .normal)
            
        case .depozit:
            imageView.image = UIImage(named: "MyHomeCellImage3")
            label1.text = "Qulay omonat"
            label2.text = " Yillik 23% stavkali qulay omonatni oching"
            button.setTitle("Batafsil", for: .normal)
            button.setTitleColor(.white, for: .normal)
        }

    }
    
    @objc private func morePressed() {
        delegate?.didPressedMore(type)
        nmadrPressed?(type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
