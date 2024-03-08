//
//  ElectriCity.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

final class ElectriCity:UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.tabBarController?.tabBar.isHidden = true
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
        titleLabel.text = "Elektr energiya"
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
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .rgb(r: 247, g: 247, b: 247)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ElectriCityCell.self, forCellReuseIdentifier: "ElectriCityCell")
    
    }
}


extension ElectriCity:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cellType = ElectriCityCellType(rawValue: indexPath.row),
               let cell = tableView.dequeueReusableCell(
                withIdentifier: "ElectriCityCell", for: indexPath
               ) as? ElectriCityCell
        else { return UITableViewCell() }
        
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
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
    }
    
}
