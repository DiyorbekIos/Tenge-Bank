//
//  TransferViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 31/01/24.
//

import UIKit

class TransferViewController: UIViewController {
    
    private let tableView = UITableView()
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        
        view.backgroundColor = .systemGray6
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -420)
        ])
        tableView.layer.cornerRadius = 8
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransferTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    private func createLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "O'tkazmalar"
        titleLabel.font = UIFont.systemFont(ofSize: 35,weight: .bold)
        
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
    }
}

extension TransferViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath
        ) as? TransferTableViewCell else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Telefon yoki karta orqali o'tkazma"
            cell.button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        case 1:
            cell.titleLabel.text = "Hisob raqam o'rtasida o'tkazma"
            cell.button.setImage(UIImage(systemName: "dollarsign.square"), for: .normal)
        case 2:
            cell.titleLabel.text = "Qozog'istonga tezkor o'tkazmalar"
            cell.button.setImage(UIImage(systemName: "creditcard.and.123"), for: .normal)
        case 3:
            cell.titleLabel.text = "Valyuta ayirboshlash"
            cell.button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath.circle"), for: .normal)
        default:
            break
        }
        cell.button.tintColor = .appColor.primary
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
} 
