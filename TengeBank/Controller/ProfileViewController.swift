//
//  ProfileViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 16/02/24.
//

import UIKit

final class ProfileViewController:UIViewController {
    
    private let addImageButton = UIButton(type: .system)
    private let label1 = UILabel()
    private let label2 = UILabel()
    private let label3 = UILabel()
    private let tableView = UITableView()
    private let titleLabel = UILabel()
    private let languageButton = UIButton(type: .system)
    private let copyButton  = UIButton(type: .system)
    private let numberLabel = UILabel()
    private  let imagePicker =  UIImagePickerController()
    private let imageView = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profil va sozlamalar"

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.backgroundColor = .systemGray6
        createAddImageButton ()
        createLabel()
        createTitleLabel()
        createLanguageButton ()
        createCopyButton ()
        createNumberLabel()
        
       view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 85),
            tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250)
        ])
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 8
        tableView.layer.masksToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
    
    }
    
    private func createAddImageButton () {
        view.addSubview(addImageButton)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addImageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addImageButton.heightAnchor.constraint(equalToConstant: 30),
            addImageButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        addImageButton.setImage(UIImage(systemName: "person.crop.circle.fill.badge.plus"), for: .normal)
        addImageButton.tintColor = .appColor.primary
        addImageButton.layer.cornerRadius = 3
        addImageButton.layer.borderWidth = 0.5
        addImageButton.layer.borderColor = UIColor.orange.cgColor
        addImageButton.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
        let scaleDownTransform = CGAffineTransform(scaleX: 3.2, y: 3.2)
        addImageButton.transform = scaleDownTransform
        
        addImageButton.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: addImageButton.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: addImageButton.trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: addImageButton.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 0)
        ])
        imageView.layer.cornerRadius  = .zero
       
    }
    
    private func createLabel() {
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.bottomAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 70),
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        label1.text = "DIYORBEK TURONBOYEV"
        label1.font = .systemFont(ofSize: 18, weight: .bold)
        
        
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.bottomAnchor.constraint(equalTo: label1.bottomAnchor, constant: 35),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155)
        ])
        label2.text = "Holat:"
        label2.font = .systemFont(ofSize: 18)
        
        
        view.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label3.bottomAnchor.constraint(equalTo: label1.bottomAnchor, constant: 35),
            label3.trailingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 45)
        ])
        label3.text = "Do'st"
        label3.textColor = .orange
        label3.font = .systemFont(ofSize: 18)
        label3.font = .boldSystemFont(ofSize: 18)
        
    }
    
    private func  createTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.topAnchor.constraint(equalTo:label3.bottomAnchor, constant: 50)
        ])
        titleLabel.text = "Sozlash"
        titleLabel.backgroundColor = .white
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.layer.cornerRadius = 10
    }
    
    private func createLanguageButton () {
        tableView.addSubview(languageButton)
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            languageButton.leadingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 310),
            languageButton.topAnchor.constraint(equalTo:tableView.topAnchor ,constant: 20),
            languageButton.widthAnchor.constraint(equalToConstant: 40),
            languageButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        languageButton.setTitle("UZ", for: .normal)
        languageButton.tintColor = .appColor.primary
        languageButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
    }
    
    private func createCopyButton () {
        tableView.addSubview(copyButton)
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            copyButton.leadingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 310),
            copyButton.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 100),
            copyButton.heightAnchor.constraint(equalToConstant: 40),
            copyButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        copyButton.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        copyButton.tintColor = .appColor.primary
        copyButton.addTarget(self, action: #selector(copyButtonPressed), for: .touchUpInside)
    }
    
    private func createNumberLabel() {
        tableView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 60),
            numberLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 90),
            numberLabel.widthAnchor.constraint(equalToConstant: 300),
            numberLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        numberLabel.text = "  Mening telefon raqamim"
        numberLabel.textColor = .systemGray
    
    }
    
    @objc func showActionSheet() {
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
//        actionSheet.view.tintColor = .black

        let option1 = UIAlertAction(title: "Русский", style: .default) { _ in
            self.languageButton.setTitle("Py", for: .normal)
        }

        let option2 = UIAlertAction(title: "English", style: .default) { _ in
            self.languageButton.setTitle("En", for: .normal)
        }

        let option3 = UIAlertAction(title: "O'zbekcha", style: .default) { _ in
            self.languageButton.setTitle("Uz", for: .normal)
        }
        
        actionSheet.addAction(option1)
        actionSheet.addAction(option2)
        actionSheet.addAction(option3)

        present(actionSheet, animated: true, completion: nil)
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func copyButtonPressed() {
        UIPasteboard.general.string = numberLabel.text
        
        let alert = UIAlertController(title: "Nusxa ko'chirildi", message: "Telefon raqamingizdan nusxa olindi", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func leaveButtonPressed() {
        // create the alert
        let alert = UIAlertController(title: "", message: "Haqiqatdan ham profilingizni o'chirmoqchimisiz", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Ha", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yo'q", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc private  func addImageButtonTapped() {
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = false
        self.imagePicker.mediaTypes = ["public.image","public.movie"]
        
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.present(self.imagePicker, animated: true, completion:nil)
        }
    }
}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell
        else {return UITableViewCell()}
        
        switch indexPath.row {
        case 0:
            cell.label.text = "  Tilni tanlang"
            cell.button.setImage(UIImage(systemName: "network"), for: .normal)
        case 1:
            cell.label.text = "  +998883733666"
            cell.button.setImage(UIImage(systemName: "iphone.gen3"), for: .normal)
        case 2:
            cell.label.text = "  Profilni o'chirish"
            cell.button.setImage(UIImage(systemName: "trash"),for:.normal)
            
            cell.label.textColor = .red
        default:
            break
        }
        cell.button.tintColor = .appColor.primary
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.item == 2 {
            leaveButtonPressed()
        }
    }
    
}


extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if info[.mediaType] as? String == "public.image" {
            self.handlePhoto(info)
        } else if info[.mediaType] as? String == "public.movie" {
            
        } else {
            print ("DEBUG PRINT:", "Media was neither Image or Video.")
        }
        
        DispatchQueue.main.async { [weak self ] in
            self?.dismiss (animated: true, completion: nil)
        }
    }
    
        // MARK: -  images
     private func handlePhoto(_ info:[UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                self.imageView.image = image
        }
    }
}
