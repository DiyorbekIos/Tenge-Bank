//
//  CardsViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 19/02/24.
//

import UIKit
 
final class  CardsViewController:UIViewController {
    
    private let titleLabel = UILabel()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: UIScreen.main.bounds,
            collectionViewLayout: createLayout()
        )
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray6
        collectionView.register(MyCardsCell.self, forCellWithReuseIdentifier: "MyCardsCell")
        collectionView.register(OpenCardsCell.self, forCellWithReuseIdentifier: "OpenCardsCell")
        collectionView.register(HumoVirtualCell.self, forCellWithReuseIdentifier: "HumoVirtualCardsCell")
        collectionView.register(MasterCardCell.self, forCellWithReuseIdentifier: "MasterCardCell")
       
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        createNavigation()
        
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
        titleLabel.text = "Kartalar"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .left
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "creditcard.trianglebadge.exclamationmark"),
            style: .done,
            target: self,
            action: #selector(rightBarButtonItemPressed)
        )
        navigationItem.rightBarButtonItem?.tintColor = .appColor.primary
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarButtonItemPressed() {
        // create the alert
        let alert = UIAlertController(title: "", message: "TengeBankda ochilga barcha MasterCard va HUMO Virtual kartalaringizni yuklab olishni xohlaysizmi?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Tasdiqlash", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Bekor qilish", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            guard let index = CardsSectionType(rawValue: sectionIndex) else { return nil }
            
            switch index {
            
            case .myCards:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/1.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 5
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .openCards:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/1.1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 30, leading: 10, bottom: 10, trailing: 10)
                return section
                
            case.humoVirtualCards:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/1.1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .mastercard:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/1.1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            }
        }
        return layout
    }
}

    

extension CardsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CardsSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = CardsSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
            
        case .myCards:
            return 1
        case .openCards:
            return 1
        case .humoVirtualCards:
            return 1
        case .mastercard:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = CardsSectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
            
        case .myCards:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MyCardsCell", for: indexPath) as! MyCardsCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .openCards:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "OpenCardsCell", for: indexPath) as! OpenCardsCell
            cell.layer.cornerRadius = 10
            cell.backgroundColor = .white
            return cell
        case .humoVirtualCards:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HumoVirtualCardsCell", for: indexPath) as! HumoVirtualCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .mastercard:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MasterCardCell", for: indexPath) as! MasterCardCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        }
    }
}



enum CardsSectionType: Int, CaseIterable {
   
    case myCards
    case openCards
    case humoVirtualCards
    case mastercard
}
