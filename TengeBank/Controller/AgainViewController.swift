//
//  AgainViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 01/02/24.
//


import UIKit

class AgainViewController: UIViewController {
    
    private let tableView = UITableView()
    private let titleLabel = UILabel()
    private let exitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        title = "Yana"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .systemGray6
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        tableView.layer.cornerRadius = 8
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AgainTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func createButton() {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName:"rectangle.portrait.and.arrow.right"), for: .normal)
        button.addTarget(self, action: #selector(leavePressed), for: .touchUpInside)
        button.tintColor = .appColor.primary
        
        navigationItem.rightBarButtonItem = .init(customView: button)
    }
    
    @objc private func leavePressed() {
        let alert = UIAlertController(title: "", message: "Haqiqatdan ham ilovadan chiqmoqchimisiz?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Ha", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yo'q", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension AgainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath
        ) as? AgainTableViewCell  else {return UITableViewCell() }
        cell.backgroundColor = .white
//        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Profil va sozlamalar"
            cell.button.setImage(UIImage(systemName: "person"), for: .normal)
        case 1:
            cell.titleLabel.text = "Filiallar va bankomatlar"
            cell.button.setImage(UIImage(systemName: "bag"), for: .normal)
        case 2:
            cell.titleLabel.text = "Biz haqimizda"
            cell.button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        case 3:
            cell.titleLabel.text = "Xavfsizlik sozlamalari"
            cell.button.setImage(UIImage(systemName: "shield"), for: .normal)
        case 4:
            cell.titleLabel.text = "Ulashish"
            cell.button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        case 5:
            cell.titleLabel.text = "UzAuto Motorsdan pul mablag'larini qaytarish"
            cell.button.setImage(UIImage(systemName: "car"), for: .normal)
        case 6:
            cell.titleLabel.text = "Mening uyim"
            cell.button.setImage(UIImage(systemName:"house"), for: .normal)
        case 7:
            cell.titleLabel.text = "Davlat xizmatlari"
            cell.button.setImage(UIImage(systemName: "house.and.flag"), for: .normal)
        case 8:
            cell.titleLabel.text = "Mening arizalarim"
            cell.button.setImage(UIImage(systemName: "doc.plaintext"), for: .normal)
        default:
            return UITableViewCell()
        }
        
        cell.button.backgroundColor = .white
        cell.button.tintColor = .appColor.primary
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
            
        case 0:
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        case 1:
            break
        case 2:
            navigationController?.pushViewController(AboutUsViewController(), animated: true)
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        case 7:
            break
        case 8:
            navigationController?.pushViewController(MeningArizalarimViewController(), animated: true)
        default:
            break
        }
    }
}
