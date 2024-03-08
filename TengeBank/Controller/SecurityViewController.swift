//
//  SecurityViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 03/03/24.
//

import UIKit
import SwiftUI

final class SecurityViewController:UIViewController {
    
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
        tableView.register(SecurityCell.self, forCellReuseIdentifier: "SecurityCell")
        tableView.isScrollEnabled = false
    }
    
    @objc func switchButtonTapped(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch yoqildi")
        } else {
            print("Switch o'chirildi")
        }
    }
}


extension SecurityViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cellType = SecurityType(rawValue: indexPath.row),
               let cell = tableView.dequeueReusableCell(
                withIdentifier: "SecurityCell", for: indexPath
               ) as? SecurityCell
        else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            cell.button.tintColor = .blue
        case 1:
            cell.button.tintColor = .blue
        case 2:
            cell.button.tintColor = .blue
        case 3:
            cell.button.tintColor = .gray
            let switchButton = UISwitch(frame: CGRect(x: 300, y: 18, width: 40, height: 20))
            cell.contentView.addSubview(switchButton)
            switchButton.isOn = true
            switchButton.addTarget(self, action: #selector(switchButtonTapped), for: .valueChanged)
        case 4:
            cell.button.tintColor = .appColor.primary
        default:
            break
        }
        cell.prepare(type: cellType)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(ReliableDeviceViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(ChangePasswordViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(UIHostingController(rootView: Verification()), animated: true)
        case 3:
            break
        case 4:
            navigationController?.pushViewController(ChangeNumberViewController(), animated: true)
        default:
            break
        }
    }
    
}
