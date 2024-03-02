//
//  AcceptViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 28/02/24.
//

import UIKit

final class AcceptViewController:UIViewController{
    
    private let titleLabel = UILabel()
    private let segmentedControl = UISegmentedControl()
    private let card1View = UIView()
    private let masterCardImage = UIImageView()
    private let cardLabel = UILabel()
    private let cardLabel2 = UILabel()
    private let cardLabel3 = UILabel()
    private let searchController = UISearchController(searchResultsController: nil)
    private let card2View = UIView()
    private let masterCardImage2 = UIImageView()
    private let cardsLabel = UILabel()
    private let cardsLabel3 = UILabel()

    
    override func viewDidLoad() {
         super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        createNavigation()
        createSegmentedControl()
        createView1 ()
        setupSearchController()
        createView2()
       
    }
    
    private func createNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "x.circle"),
            style: .done,
            target: self,
            action: #selector(leftButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        
        navigationItem.titleView = titleLabel
        titleLabel.text = "Qayerga"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .center
        
    }
    
    @objc private func leftButtonTapped() {
        self.dismiss(animated: true)
//       navigationController?.popViewController(animated: true)
    }
    
    private func createSegmentedControl () {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            segmentedControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.insertSegment(withTitle: "Mening kartalarim", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Oxirgi qabul qiluvchilar", at: 1, animated: true)
        segmentedControl.selectedSegmentTintColor = .appColor.primary
        segmentedControl.tintColor = .black
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    private func createView1 () {
        view.addSubview(card1View)
        card1View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card1View.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card1View.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            card1View.heightAnchor.constraint(equalToConstant: 60),
            card1View.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        card1View.backgroundColor = .white
       
        card1View.addSubview(masterCardImage)
        masterCardImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            masterCardImage.leadingAnchor.constraint(equalTo: card1View.leadingAnchor,constant: 10),
            masterCardImage.topAnchor.constraint(equalTo: card1View.topAnchor, constant: 10),
            masterCardImage.bottomAnchor.constraint(equalTo: card1View.bottomAnchor, constant: -10),
            masterCardImage.widthAnchor.constraint(equalToConstant: 40)
        ])
        masterCardImage.layer.cornerRadius = 5
        masterCardImage.layer.borderWidth = 2
        masterCardImage.layer.borderColor = UIColor.systemGray6.cgColor
        masterCardImage.image = UIImage(named: "Mastercard")
        
        card1View.addSubview(cardLabel)
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: masterCardImage.trailingAnchor, constant: 10),
            cardLabel.topAnchor.constraint(equalTo: card1View.topAnchor, constant: 10),
            cardLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        cardLabel.text = "Tenge bank"
        cardLabel.textColor = .black
        
        card1View.addSubview(cardLabel2)
        cardLabel2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel2.trailingAnchor.constraint(equalTo: card1View.trailingAnchor, constant: -15),
            cardLabel2.topAnchor.constraint(equalTo: card1View.topAnchor,constant: 10),
            cardLabel2.heightAnchor.constraint(equalToConstant:  20)
        ])
        cardLabel2.text = "0.oo uzs"
        cardLabel2.textColor = .black
        
        card1View.addSubview(cardLabel3)
        cardLabel3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel3.leadingAnchor.constraint(equalTo: masterCardImage.trailingAnchor, constant: 15),
            cardLabel3.heightAnchor.constraint(equalToConstant:  15),
            cardLabel3.bottomAnchor.constraint(equalTo: card1View.bottomAnchor, constant: -10)
        ])
        cardLabel3.text = ".....1475"
        cardLabel3.textColor = .gray
    
    }
    
    func setupSearchController() {
    
        
        view.addSubview(searchController.searchBar)
        
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchController.searchBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 40).isActive = true
        searchController.searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchController.searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func createView2 ()  {
        view.addSubview(card2View)
        card2View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card2View.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card2View.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 100),
            card2View.heightAnchor.constraint(equalToConstant: 60),
            card2View.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
        card2View.backgroundColor = .white
       
        card2View.addSubview(masterCardImage2)
        masterCardImage2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            masterCardImage2.leadingAnchor.constraint(equalTo: card2View.leadingAnchor,constant: 10),
            masterCardImage2.topAnchor.constraint(equalTo: card2View.topAnchor, constant: 10),
            masterCardImage2.bottomAnchor.constraint(equalTo: card2View.bottomAnchor, constant: -10),
            masterCardImage2.widthAnchor.constraint(equalToConstant: 40)
        ])
        masterCardImage2.layer.cornerRadius = 5
        masterCardImage2.layer.borderWidth = 2
        masterCardImage2.layer.borderColor = UIColor.systemGray6.cgColor
        masterCardImage2.image = UIImage(named: "Mastercard")
        
        card2View.addSubview(cardsLabel)
        cardsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsLabel.leadingAnchor.constraint(equalTo: masterCardImage2.trailingAnchor, constant: 10),
            cardsLabel.topAnchor.constraint(equalTo: card2View.topAnchor, constant: 10),
            cardsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        cardsLabel.text = "DIYORBEK TURONBOYEV"
        cardsLabel.textColor = .black
        
       
        
        card2View.addSubview(cardsLabel3)
        cardsLabel3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsLabel3.leadingAnchor.constraint(equalTo: masterCardImage2.trailingAnchor, constant: 15),
            cardsLabel3.heightAnchor.constraint(equalToConstant:  15),
            cardsLabel3.bottomAnchor.constraint(equalTo: card2View.bottomAnchor, constant: -10)
        ])
        cardsLabel3.text = ".....1475"
        cardsLabel3.textColor = .gray
    }
    
   
    
    @objc private func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
           let selectedIndex = segmentedControl.selectedSegmentIndex
           
        if selectedIndex == 0 {
            
            card1View.isHidden = false
            searchController.isActive = true
            card2View .isHidden = true
        }
        else {
               card1View.isHidden = true
               searchController.isActive = false
               card2View.isHidden = false
           }
       }
}

