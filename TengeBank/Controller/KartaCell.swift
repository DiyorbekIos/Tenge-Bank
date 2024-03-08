//
//  KartaCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 15/02/24.
//

import UIKit

enum KartaCellType:Int {
    case button1
    case button2
}

protocol KartaCellDelegate: AnyObject {
    func didPressedMore(_ type: KartaCellType)
}

final class KartaCell:UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
     let button = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    
    var nmadrPressed: ((KartaCellType) -> ())?
    
    weak var delegate: KartaCellDelegate?
    
    var type: KartaCellType = .button1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        titleLabel.text = "Kartalar"
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            tableView.heightAnchor.constraint(equalToConstant: 180),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(KartaTableViewCell.self, forCellReuseIdentifier: "cell")
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 250)
        ])
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appColor.primary.cgColor
        button.setTitleColor(.appColor.primary, for: .normal)
        button.tintColor = .appColor.primary
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(morePressed), for: .touchUpInside)
        
        contentView.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            button2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button2.topAnchor.constraint(equalTo: button.topAnchor, constant: 55),
            button2.heightAnchor.constraint(equalToConstant: 25)
        ])
        button2.setTitleColor(.appColor.primary, for: .normal)
        button2.addTarget(self, action: #selector(morePressed), for: .touchUpInside)
    }
    @objc private func morePressed() {
        delegate?.didPressedMore(type)
        nmadrPressed?(type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KartaCell:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! KartaTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.label.text = "Tenge bank . 1475"
            cell.image.image = UIImage(named: "Mastercard")
            cell.label2.text = "0.00 UZS"
        case 1:
            cell.label.text = "Tenge humo Virtual . 7467"
            cell.image.image = UIImage(named: "Humo")
            cell.label2.text = "0.00 UZS"
        default:
            break
        }
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



