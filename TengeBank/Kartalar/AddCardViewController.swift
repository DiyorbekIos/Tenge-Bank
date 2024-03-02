//
//  AddCardViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 26/02/24.
//


import UIKit

enum Card:String {
    case kartaNomi
    case kartaRaqami
    case valid
}

class AddCardViewController: UIViewController {
    
    private let textField = UITextField ()
    private let placeholderLabel = UILabel()
    private let textField2 = UITextField()
    private let placeholderLabel2  = UILabel()
    private let textField3 = UITextField()
    private let placeholderLabel3 = UILabel()
    private let titleLabel = UILabel()
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .systemGray6
          createNavigation()
          createTextField()
          createTextField2()
          createTextField3()
          createButton ()
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
        titleLabel.text = "Karta qo'shish"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
 
    private func createTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor,constant: 110),
            textField.heightAnchor.constraint(equalToConstant: 60),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .white
        
    
        placeholderLabel.textColor = .gray
        placeholderLabel.text = "Karta nomi"
        placeholderLabel.alpha = 1
        textField.addSubview(placeholderLabel)
        placeholderLabel.font = .systemFont(ofSize: 18)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor,constant: 10).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: textField.topAnchor,constant: 20).isActive = true
        placeholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    private func createTextField2() {
        view.addSubview(textField2)
        textField2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField2.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            textField2.heightAnchor.constraint(equalToConstant: 60),
            textField2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        textField2.layer.cornerRadius = 8
        textField2.backgroundColor = .white
        textField2.keyboardType = .numberPad
        textField2.delegate = self
        
    
        placeholderLabel2.textColor = .gray
        placeholderLabel2.text = "Karta raqami"
        placeholderLabel2.alpha = 1
        textField2.addSubview(placeholderLabel2)
        placeholderLabel2.font = .systemFont(ofSize: 18)
        placeholderLabel2.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel2.leadingAnchor.constraint(equalTo: textField2.leadingAnchor,constant: 10).isActive = true
        placeholderLabel2.topAnchor.constraint(equalTo: textField2.topAnchor,constant: 20).isActive = true
        placeholderLabel2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    private func createTextField3() {
        view.addSubview(textField3)
        textField3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
            textField3.heightAnchor.constraint(equalToConstant: 60),
            textField3.widthAnchor.constraint(equalToConstant: 100)
        ])
        textField3.keyboardType = .numberPad
        textField3.delegate = self
        textField3.layer.cornerRadius = 8
        textField3.backgroundColor = .white
        
    
        placeholderLabel3.textColor = .gray
        placeholderLabel3.text = "OO/YY"
        placeholderLabel3.alpha = 1
        textField3.addSubview(placeholderLabel3)
        placeholderLabel3.font = .systemFont(ofSize: 18)
        placeholderLabel3.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel3.leadingAnchor.constraint(equalTo: textField3.leadingAnchor,constant: 10).isActive = true
        placeholderLabel3.topAnchor.constraint(equalTo: textField3.topAnchor,constant: 20).isActive = true
        placeholderLabel3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    private func createButton () {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        button.setTitle("Keyingi", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .appColor.primary
        button.tintColor = .white
    }
}

extension AddCardViewController:  UITextFieldDelegate {

    // ...

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        if textField.text?.isEmpty ?? true {
//            animatePlaceholderLabel(for: textField, isMovingUp: true)
//        }
//        
//         if  textField2.text?.isEmpty ?? true {
//            animatePlaceholderLabel(for: textField2, isMovingUp: true)
//        }
//        
//        if  textField3.text?.isEmpty ?? true {
//           animatePlaceholderLabel(for: textField3, isMovingUp: true)
//       }
    
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            animatePlaceholderLabel(for: textField, isMovingUp: false)
        }
        
         if textField2.text?.isEmpty ?? true {
            animatePlaceholderLabel(for: textField2, isMovingUp: false)
        }
        
        if textField3.text?.isEmpty ?? true {
           animatePlaceholderLabel(for: textField3, isMovingUp: false)
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
            self.placeholderLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
            self.placeholderLabel.font = .systemFont(ofSize: 14)
        }
        
        let duration2 = 0.3
        let _: CGFloat = isMovingUp ?  -textField2.frame.height - 10 : 0
        
        UIView.animate(withDuration: duration2) {
            self.placeholderLabel2.alpha = isMovingUp ? 1 : 0
            self.placeholderLabel2.transform = CGAffineTransform(translationX: 0, y: -15)
            self.placeholderLabel2.textColor = .appColor.primary
            self.placeholderLabel2.heightAnchor.constraint(equalToConstant: 10).isActive = true
            self.placeholderLabel2.font = .systemFont(ofSize: 14)
        }
    
        
        let duration3 = 0.3
        let _: CGFloat = isMovingUp ?  -textField3.frame.height - 10 : 0
        
        UIView.animate(withDuration: duration3) {
            self.placeholderLabel3.alpha = isMovingUp ? 1 : 0
            self.placeholderLabel3.transform = CGAffineTransform(translationX: 0, y: -15)
            self.placeholderLabel3.textColor = .appColor.primary
            self.placeholderLabel3.heightAnchor.constraint(equalToConstant: 10).isActive = true
            self.placeholderLabel3.font = .systemFont(ofSize: 14)
        }
    }
}



