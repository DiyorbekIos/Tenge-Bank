//
//  UzautoViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 05/03/24.
//

import UIKit

final class UzautoViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let label = UILabel()
    private let textField = UITextField()
    private let placeholderLabel = UILabel()
    private let checkmark = UIButton(type: .system)
    private let checkmarks = UIButton(type: .system)
    var isButtonSelected = true
    private let dataLabel = UILabel()
    private  let dataButton = UIButton()
    private let dataLabel2 = UILabel()
    private let dataLabel3 = UILabel()
    private let button = UIButton()
    private let infoImage = UIImageView()
    private let infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        setLabel()
        setTextField()
        setData()
        setButton()
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
        titleLabel.text = "To'lovni qaytarish uchun ariza"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func  setLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 17)
        ])
        label.text = "Mijoz ma'lumotlari"
        label.font = .systemFont(ofSize: 18)
        
    }
    
    private func setTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant:  60),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        textField.layer.cornerRadius = 8
        textField.delegate = self
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad
        
        
        placeholderLabel.textColor = .gray
        placeholderLabel.text = "Shartnoma raqami"
        placeholderLabel.alpha = 1
        textField.addSubview(placeholderLabel)
        placeholderLabel.font = .systemFont(ofSize: 18)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor,constant: 10).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: textField.topAnchor,constant: 20).isActive = true
        placeholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setData() {
        view.addSubview(checkmark)
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkmark.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            checkmark.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            checkmark.heightAnchor.constraint(equalToConstant: 30),
            checkmark.widthAnchor.constraint(equalToConstant: 30)
        ])
        checkmark.setImage(UIImage(systemName: "square"), for: .normal)
        checkmark.tintColor = .appColor.primary
        checkmark.addTarget(self, action: #selector(checkmarkTapped), for: .touchUpInside)
        
        view.addSubview(dataLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 28),
            dataLabel.leadingAnchor.constraint(equalTo: checkmark.trailingAnchor , constant: 10),
            dataLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
        dataLabel.text = "Men"
        dataLabel.textColor = .gray
        dataLabel.font = .systemFont(ofSize: 15)
        
        view.addSubview(dataButton)
        dataButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataButton.leadingAnchor.constraint(equalTo: dataLabel.trailingAnchor,constant: 10),
            dataButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 28),
            dataButton.heightAnchor.constraint(equalToConstant: 18)
        ])
//        dataButton.setTitle("shaxsiy ma'lumotlarni", for: .normal)
        dataButton.setTitleColor(.appColor.primary, for: .normal)
        dataButton.titleLabel?.font = .systemFont(ofSize: 15)
        let attributedString = NSMutableAttributedString(string: "shaxsiy ma'lumotlarni")
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
                attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.red, range: NSRange(location: 0, length: attributedString.length))
               dataButton.setAttributedTitle(attributedString, for: .normal)
        
        view.addSubview(dataLabel2)
        dataLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel2.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 28),
            dataLabel2.leadingAnchor.constraint(equalTo:dataButton.trailingAnchor , constant: 10),
            dataLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
        dataLabel2.text = "qayta ishlashga"
        dataLabel2.textColor = .gray
        dataLabel2.font = .systemFont(ofSize: 15)
        
        view.addSubview(dataLabel3)
        dataLabel3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel3.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 0),
            dataLabel3.leadingAnchor.constraint(equalTo:checkmark.trailingAnchor , constant: 10),
            dataLabel3.heightAnchor.constraint(equalToConstant: 18),
        ])
        dataLabel3.text = "rozilik beraman"
        dataLabel3.textColor = .gray
        dataLabel3.font = .systemFont(ofSize: 15)
    }
    
    @objc func checkmarkTapped(){
        isButtonSelected.toggle()
        
        if isButtonSelected {
            checkmark.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkmark.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    private func setButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        button.backgroundColor = .rgb(r: 170, g: 188, b: 199)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Davom etish", for: .normal)
        button.layer.cornerRadius = 10
        
        view.addSubview(infoImage)
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            infoImage.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            infoImage.heightAnchor.constraint(equalToConstant: 20),
            infoImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        infoImage.image = UIImage(systemName: "info.circle")
        infoImage.tintColor = .orange
        
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: infoImage.trailingAnchor, constant: 10),
            infoLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: -60),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15)
        ])
        infoLabel.text = "UzAuto Motors AJga avtomashinalarni sotib olish uchun avval to'langan mablag'larning bir qismini qaytarish"
        infoLabel.numberOfLines = 3
        infoLabel.font = .systemFont(ofSize: 15)
    }
}


extension UzautoViewController:  UITextFieldDelegate {

    // ...

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            animatePlaceholderLabel(for: textField, isMovingUp: true)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            animatePlaceholderLabel(for: textField, isMovingUp: false)
        }
    }

    // Placeholderni animatsiya bilan aylantirish uchun yordamchi metod
    private func animatePlaceholderLabel(for textField: UITextField, isMovingUp: Bool) {
        let duration = 0.3
        let _: CGFloat = isMovingUp ?  -textField.frame.height - 10 : 0
        
        UIView.animate(withDuration: duration) {
            self.placeholderLabel.alpha = isMovingUp ? 1 : 0
            self.placeholderLabel.transform = CGAffineTransform(translationX: 0, y: -15)
            self.placeholderLabel.textColor = .appColor.primary
            self.placeholderLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
            self.placeholderLabel.font = .systemFont(ofSize: 14)
        }
      
    }
}
