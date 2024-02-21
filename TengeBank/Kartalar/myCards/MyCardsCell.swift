//
//  MyCardsCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 20/02/24.
//

import UIKit

final class MyCardsCell:UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createTitle()
        
        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            tableView.heightAnchor.constraint(equalToConstant: 180),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCardsTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func createTitle() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        ])
        titleLabel.text = "Mening kartalarim"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension  MyCardsCell: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCardsTableViewCell
        
        switch indexPath.row {
            
        case 0:
            cell.label.text = "Tenge humo Virtual . 7467"
            cell.image.image = UIImage(named: "Humo")
            cell.label2.text = "0.00 UZS"
            
        case 1:
            cell.label.text = "Tenge bank . 1475"
            cell.image.image = UIImage(named: "Mastercard")
            cell.label2.text = "0.00 UZS"
            
        default:
            break
        }
        cell.label.textColor = .systemGray2
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

