//
//  PublicServiceViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

final class PublicServiceViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        createNavigation()
        createTableView()
    }
    private func createNavigation() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.titleView = titleLabel
        titleLabel.text = "Xavfsizlik sozlamalari"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func createTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149.5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -390)
        ])
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PublicCell.self, forCellReuseIdentifier: "PublicCell")
        tableView.isScrollEnabled = false
    }

}


extension PublicServiceViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cellType = PublicType(rawValue: indexPath.row),
               let cell = tableView.dequeueReusableCell(
                withIdentifier: "PublicCell", for: indexPath
               ) as? PublicCell
        else { return UITableViewCell() }
        
        cell.prepare(type: cellType)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(BirthCertificateViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(InformationAboutMarriage(), animated: true)
        case 2:
            navigationController?.pushViewController(InformationAboutDecision(), animated: true)
        case 3:
            navigationController?.pushViewController(AboutRealEstate(), animated: true)
        case 4:
            navigationController?.pushViewController(AboutTransport(), animated: true)
        default:
            break
        }
    }
}
