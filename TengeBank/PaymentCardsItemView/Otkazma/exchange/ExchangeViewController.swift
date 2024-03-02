//
//  ExchangeViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 21/02/24.
//

import UIKit

final class ExchangeViewController:UIViewController {
    
    private let titleLabel = UILabel()
    private let segmentedControl = UISegmentedControl()
    private let whereLabel = UILabel()
    private let cardView = UIView()
    private let cardButton = UIButton()
    private let cardLabel = UILabel()
    private let chevronButon = UIButton()
    private let cardViewButton = UIButton()
    private let costLabel = UILabel()
    private let whereLabel2 = UILabel()
    private let cardView2 = UIView()
    private let cardButton2 = UIButton()
    private let cardLabel2 = UILabel()
    private let chevronButon2 = UIButton()
    private let cardView2Button = UIButton()
    private let inputLabel = UILabel()
    private let textField = UITextField()
    private let placeholderLabel = UILabel()
    private let button = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        createSegment()
        setWhereLabel()
        setCardView()
        setCostLabel()
        setCard2View()
        setInputs()
        setTextField()
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
        titleLabel.text = "Valyuta ayirboshlash"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .left
        
        
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func createSegment() {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        segmentedControl.insertSegment(withTitle: "Olish", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Sotish", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .appColor.primary
    }
    
    private func  setWhereLabel() {
        view.addSubview(whereLabel)
        whereLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whereLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            whereLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            whereLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        whereLabel.text = "Qayerdan"
        whereLabel.textColor = .black
        whereLabel.font = .systemFont(ofSize: 14)
        
    }
    
    private func  setCardView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.topAnchor.constraint(equalTo: whereLabel.bottomAnchor, constant: 20),
            cardView.heightAnchor.constraint(equalToConstant: 80),
            cardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        cardView.layer.cornerRadius = 12
        cardView.backgroundColor = .white
        
        cardView.addSubview(cardViewButton)
        cardViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardViewButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0),
            cardViewButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0),
            cardViewButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 0),
            cardViewButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0)
        ])
        cardViewButton.addTarget(self, action: #selector(cardViewButtonTapped), for: .touchUpInside)
        
        cardView.addSubview(cardButton)
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cardButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            cardButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
        ])
        cardButton.setImage(UIImage(systemName: "creditcard"), for: .normal)
        cardButton.tintColor = .appColor.primary
        let scaleDownTransform = CGAffineTransform(scaleX: 1.9 ,y: 1.9)
        cardButton.transform = scaleDownTransform
        
        
        cardView.addSubview(cardLabel)
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: cardButton.trailingAnchor, constant: 20),
            cardLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 30),
            cardLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        cardLabel.text = " Hisobni tanlang"
        cardLabel.textColor = UIColor.black
        cardLabel.font = UIFont.systemFont(ofSize: 18)
        
        
        cardView.addSubview(chevronButon)
        chevronButon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronButon.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            chevronButon.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            chevronButon.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -15)
        ])
        chevronButon.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        chevronButon.tintColor = .appColor.primary
        
    }
    
    private func setCostLabel() {
        view.addSubview(costLabel)
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            costLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            costLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 15),
            costLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        costLabel.text = "Umumiy xarajat 0"
        costLabel.textColor = .gray
        costLabel.font = .systemFont(ofSize: 16)
        
        view.addSubview(whereLabel2)
        whereLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whereLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            whereLabel2.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 10),
            whereLabel2.heightAnchor.constraint(equalToConstant: 20)
        ])
        whereLabel2.text = "Qayerga"
        whereLabel2.textColor = .black
        whereLabel2.font = .systemFont(ofSize: 14)
    }
    
    
    private func  setCard2View() {
        view.addSubview(cardView2)
        cardView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView2.topAnchor.constraint(equalTo: whereLabel2.bottomAnchor, constant: 20),
            cardView2.heightAnchor.constraint(equalToConstant: 80),
            cardView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        cardView2.layer.cornerRadius = 12
        cardView2.backgroundColor = .white
        
        cardView2.addSubview(cardView2Button)
        cardView2Button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView2Button.leadingAnchor.constraint(equalTo: cardView2.leadingAnchor, constant: 0),
            cardView2Button.trailingAnchor.constraint(equalTo: cardView2.trailingAnchor, constant: 0),
            cardView2Button.topAnchor.constraint(equalTo: cardView2.topAnchor, constant: 0),
            cardView2Button.bottomAnchor.constraint(equalTo: cardView2.bottomAnchor, constant: 0)
        ])
        cardView2Button.addTarget(self, action: #selector(cardView2ButtonTapped), for: .touchUpInside)
        
        cardView2.addSubview(cardButton2)
        cardButton2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardButton2.leadingAnchor.constraint(equalTo: cardView2.leadingAnchor, constant: 20),
            cardButton2.topAnchor.constraint(equalTo: cardView2.topAnchor, constant: 10),
            cardButton2.bottomAnchor.constraint(equalTo: cardView2.bottomAnchor, constant: -10),
        ])
        cardButton2.setImage(UIImage(systemName: "creditcard"), for: .normal)
        cardButton2.tintColor = .appColor.primary
        let vc = CGAffineTransform(scaleX: 1.9 ,y: 1.9)
        cardButton2.transform = vc
        
        cardView2.addSubview(cardLabel2)
        cardLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel2.leadingAnchor.constraint(equalTo: cardButton2.trailingAnchor, constant: 20),
            cardLabel2.topAnchor.constraint(equalTo: cardView2.topAnchor, constant: 30),
            cardLabel2.heightAnchor.constraint(equalToConstant: 20)
        ])
        cardLabel2.text = " Hisobni tanlang"
        cardLabel2.textColor = UIColor.black
        cardLabel2.font = UIFont.systemFont(ofSize: 18)
        
        
        cardView2.addSubview(chevronButon2)
        chevronButon2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronButon2.trailingAnchor.constraint(equalTo: cardView2.trailingAnchor, constant: -15),
            chevronButon2.topAnchor.constraint(equalTo: cardView2.topAnchor, constant: 20),
            chevronButon2.bottomAnchor.constraint(equalTo: cardView2.bottomAnchor, constant: -15)
        ])
        chevronButon2.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        chevronButon2.tintColor = .appColor.primary
        
    }
    
    private func setInputs() {
        
        view.addSubview(inputLabel)
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputLabel.topAnchor.constraint(equalTo: cardView2.bottomAnchor, constant: 20),
            inputLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        inputLabel.text = " Kirim qilish uchun 0"
        inputLabel.textColor = .gray
        inputLabel.font = .systemFont(ofSize: 16)
    }
    
    
    private func setTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant:  60),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        textField.layer.cornerRadius = 8
        textField.delegate = self
        textField.backgroundColor = .white
        
        
        placeholderLabel.textColor = .gray
        placeholderLabel.text = "O'tkazma summasi"
        placeholderLabel.alpha = 1
        textField.addSubview(placeholderLabel)
        placeholderLabel.font = .systemFont(ofSize: 18)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor,constant: 10).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: textField.topAnchor,constant: 20).isActive = true
        placeholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    private func setButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        button.setTitle("Keyingi", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .rgb(r: 170, g: 199, b: 188)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 22)
    }
    
    @objc func cardViewButtonTapped() {
        let vc = UINavigationController(rootViewController: SelectCountViewController())
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.1 * context.maximumDetentValue
            }),.medium()]
        }
        present(vc,animated: true,completion: nil)
    }
    
    @objc func cardView2ButtonTapped() {
        let vc = UINavigationController(rootViewController: SelectCountViewController())
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.1 * context.maximumDetentValue
            }),.medium()]
        }
        present(vc,animated: true,completion: nil)
    }
    
}


extension ExchangeViewController:  UITextFieldDelegate {

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
            self.placeholderLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
            self.placeholderLabel.font = .systemFont(ofSize: 14)
        }
      
    }
}
