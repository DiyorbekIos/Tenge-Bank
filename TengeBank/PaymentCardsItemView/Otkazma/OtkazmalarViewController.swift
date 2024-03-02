//
//  O'tkazmalar.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 21/02/24.
//

import UIKit
import ContactsUI

final class OtkazmalarViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let label  = UILabel()
    private let whereLabel = UILabel()
    private let cardViewButton = UIButton()
    private let cardView = UIView()
    private let cardButton = UIButton(type: .system)
    private let cardLabel = UILabel()
    private let cardLabel2 = UILabel()
    private let cardButton2 = UIButton(type: .system)
    private let vieW = UIView()
    private let kartaLabel = UILabel()
    private let whereLabel2 = UILabel()
    private let personButton = UIButton(type: .system)
    private let buttonCard = UIButton(type: .system)
    private let textField = UITextField()
    private let View3 = UIView()
    private let textField2 = UITextField()
    private let placeholderLabel = UILabel()
    private let komissiyaLabel = UILabel()
    private let inkorButton = UIButton()
    private let nimadirLabel = UILabel()
    private let nimadirButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        createView()
        createView2()
        createView3()
        setLabels()
        setNimadirButton ()
        textField.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        titleLabel.text = "O'tkazmalar"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
        
        
        
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    private func createView() {
        
        view.addSubview(whereLabel)
        whereLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whereLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            whereLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            whereLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        whereLabel.text = "Qayerdan"
        whereLabel.textColor = .black
        whereLabel.font = .systemFont(ofSize: 16,weight: .bold)
        
        
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.topAnchor.constraint(equalTo: whereLabel.bottomAnchor, constant: 10),
            cardView.heightAnchor.constraint(equalToConstant: 70),
            cardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        cardView.layer.cornerRadius = 8
        cardView.backgroundColor = .white
        
        cardView.addSubview(cardViewButton)
        cardViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        cardView.addSubview(cardButton)
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5),
            cardButton.heightAnchor.constraint(equalToConstant: 50),
            cardButton.widthAnchor.constraint(equalToConstant: 50),
            cardButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            
            cardViewButton.topAnchor.constraint(equalTo: cardView.topAnchor),
            cardViewButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            cardViewButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            cardViewButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
        ])
        
        cardViewButton.addTarget(self, action: #selector(cardButtonTapped), for: .touchUpInside)
        cardButton.setImage(UIImage(systemName: "creditcard"), for: .normal)
        cardButton.layer.cornerRadius = 12
        cardButton.layer.borderWidth = 1
        cardButton.layer.borderColor = UIColor.systemGray5.cgColor
        cardButton.tintColor = .appColor.primary
        cardButton.addTarget(self, action: #selector(cardButtonTapped), for: .touchUpInside)
        
        
        cardView.addSubview(cardLabel)
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: cardButton.trailingAnchor, constant: 15),
            cardLabel.heightAnchor.constraint(equalToConstant: 20),
            cardLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10)
        ])
        cardLabel.text = "Qayerdan"
        cardLabel.font = .systemFont(ofSize: 14)
        cardLabel.textColor = .appColor.primary
        
        cardView.addSubview(cardLabel2)
        cardLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel2.leadingAnchor.constraint(equalTo: cardButton.trailingAnchor, constant: 15),
            cardLabel2.heightAnchor.constraint(equalToConstant: 30),
            cardLabel2.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25)
        ])
        cardLabel2.text = "Kartani tanlang"
        cardLabel2.font = .systemFont(ofSize: 18)
        cardLabel2.textColor = .gray
        
        
        cardView.addSubview(cardButton2)
        cardButton2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardButton2.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -20),
            cardButton2.heightAnchor.constraint(equalToConstant: 15),
            cardButton2.widthAnchor.constraint(equalToConstant: 25),
            cardButton2.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25)
        ])
        cardButton2.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        cardButton2.tintColor = .gray
    }
    
    
    private func createView2() {
        
        
        view.addSubview(whereLabel2)
        whereLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whereLabel2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            whereLabel2.topAnchor.constraint(equalTo:  cardView.bottomAnchor, constant: 10),
            whereLabel2.heightAnchor.constraint(equalToConstant: 20)
        ])
        whereLabel2.text = "Qayerga"
        whereLabel2.textColor = .black
        whereLabel2.font = .systemFont(ofSize: 16,weight: .bold)
        
        
        view.addSubview(vieW)
        vieW.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vieW.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vieW.topAnchor.constraint(equalTo: whereLabel2.bottomAnchor, constant: 10),
            vieW.heightAnchor.constraint(equalToConstant: 70),
            vieW.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-30)
        ])
        vieW.layer.cornerRadius = 8
        vieW.backgroundColor = .white
        
        
        vieW.addSubview(kartaLabel)
        kartaLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kartaLabel.leadingAnchor.constraint(equalTo: vieW.leadingAnchor, constant: 15),
            kartaLabel.topAnchor.constraint(equalTo: vieW.topAnchor, constant: 10),
            kartaLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        kartaLabel.text = "Karta yoki telefon raqami"
        kartaLabel.font = .systemFont(ofSize: 14)
        kartaLabel.textColor = .gray
        
        vieW.addSubview(personButton)
        personButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personButton.trailingAnchor.constraint(equalTo: vieW.trailingAnchor, constant: -10),
            personButton.topAnchor.constraint(equalTo: vieW.topAnchor, constant: 10),
            personButton.bottomAnchor.constraint(equalTo: vieW.bottomAnchor, constant: -10),
            personButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        personButton.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        personButton.tintColor = .appColor.primary
        let scaleDownTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        personButton.transform = scaleDownTransform
        personButton.addTarget(self, action: #selector(personButtonPressed), for: .touchUpInside)
        
        vieW.addSubview(buttonCard)
        buttonCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonCard.trailingAnchor.constraint(equalTo: personButton.leadingAnchor, constant: -10),
            buttonCard.topAnchor.constraint(equalTo: vieW.topAnchor, constant: 10),
            buttonCard.bottomAnchor.constraint(equalTo: vieW.bottomAnchor, constant: -10),
            buttonCard.widthAnchor.constraint(equalToConstant: 40)
        ])
        buttonCard.setImage(UIImage(systemName: "creditcard"), for: .normal)
        buttonCard.tintColor = .appColor.primary
        let vc = CGAffineTransform(scaleX: 1.2, y: 1.2)
        buttonCard.transform = vc
        buttonCard.addTarget(self, action: #selector(buttonCardTapped), for: .touchUpInside)
        
        vieW.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: vieW.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: buttonCard.leadingAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: kartaLabel.bottomAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: vieW.bottomAnchor, constant: 0)
        ])
        textField.text = "+998"
        textField.keyboardType = .phonePad
        
        
    }
    
    
    @objc func buttonCardTapped () {
        present(UINavigationController(rootViewController: AcceptViewController()),animated: true)
    }
    
    
    private func createView3() {
        view.addSubview(View3)
        View3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            View3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            View3.heightAnchor.constraint(equalToConstant: 70),
            View3.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30),
            View3.topAnchor.constraint(equalTo: vieW.bottomAnchor, constant: 30)
        ])
        View3.layer.cornerRadius = 8
        View3.backgroundColor = .white
        
        View3.addSubview(textField2)
        textField2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField2.leadingAnchor.constraint(equalTo: View3.leadingAnchor, constant: 0),
            textField2.trailingAnchor.constraint(equalTo: View3.trailingAnchor, constant: 0),
            textField2.topAnchor.constraint(equalTo: View3.topAnchor, constant: 0),
            textField2.bottomAnchor.constraint(equalTo: View3.bottomAnchor, constant: 0)
        ])
        textField2.placeholder = "   O'tkazma summasi"
        textField2.keyboardType = .phonePad
        
        
//        textField2.addSubview(placeholderLabel)
//        placeholderLabel.text = "O'tkazma summasi"
//        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            placeholderLabel.leadingAnchor.constraint(equalTo: textField2.leadingAnchor, constant: 10),
//            placeholderLabel.heightAnchor.constraint(equalToConstant: 15),
//            placeholderLabel.topAnchor.constraint(equalTo: textField2.topAnchor, constant: 5)
//        ])
//        placeholderLabel.textColor = .appColor.primary
        
    }
    
    private func setLabels() {
        view.addSubview(komissiyaLabel)
        komissiyaLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            komissiyaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            komissiyaLabel.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
            komissiyaLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        komissiyaLabel.text = "Komissiya 0 UZS"
        komissiyaLabel.textColor = .gray
        
        
        view.addSubview(inkorButton)
        inkorButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inkorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            inkorButton.heightAnchor.constraint(equalToConstant: 40),
            inkorButton.widthAnchor.constraint(equalToConstant: 40),
            inkorButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 70)
        ])
        inkorButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        inkorButton.tintColor = .gray
        let scaleDownTransform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        inkorButton.transform = scaleDownTransform
        
        
        view.addSubview(nimadirLabel)
        nimadirLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nimadirLabel.leadingAnchor.constraint(equalTo: inkorButton.trailingAnchor, constant: 5),
            nimadirLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nimadirLabel.topAnchor.constraint(equalTo: komissiyaLabel.bottomAnchor, constant: 10),
            nimadirLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        nimadirLabel.text = "Telefon raqami bo'yicha pul o'tkazish uchun + belgisini qo'ying"
        nimadirLabel.font = .systemFont(ofSize: 15.8)
        nimadirLabel.textColor = .gray
        nimadirLabel.numberOfLines = 2
    }
    
    private func setNimadirButton () {
        view.addSubview(nimadirButton)
        nimadirButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nimadirButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nimadirButton.topAnchor.constraint(equalTo: nimadirLabel.bottomAnchor,constant: 40),
            nimadirButton.heightAnchor.constraint(equalToConstant: 50),
            nimadirButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        nimadirButton.setTitle("Keyingi", for: .normal)
        nimadirButton.tintColor = .white
        nimadirButton.backgroundColor = .rgb(r: 170, g: 199, b: 188)
        nimadirButton.layer.cornerRadius = 8
    }
    
    @objc func personButtonPressed() {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        present(contactPicker, animated: true, completion: nil)
    }
    
    @objc func cardButtonTapped() {
        present(UINavigationController(rootViewController: WhereViewController()), animated: true)
    }
    
}

extension OtkazmalarViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        // Matn tekshirish shartlarini belgilash
        if updatedText.count > 10 {
            // Matn uzunligi cheklangan miqdordan oshmoqda
            textField.backgroundColor = .red
        } else {
            textField.backgroundColor = .white
        }
        
        return true
    }
    
    
}

extension OtkazmalarViewController : CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        // Kontakt ma'lumotlarini olish
        _ = contact.givenName
        _ = contact.familyName
        let phoneNumber = contact.phoneNumbers.first?.value.stringValue
        
        // Tanlangan kontaktning raqamini textfieldga chiqaring
        textField.text = phoneNumber
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
}
