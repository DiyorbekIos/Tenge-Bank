//
//  CreditsViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 21/02/24.
//

import  UIKit

final class CreditsViewController:UIViewController {
    
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
        collectionView.register(OnlineMikroqarzCell.self, forCellWithReuseIdentifier: "OnlineMikroqarzsCell")
        collectionView.register(MikroqarzLifeCell.self, forCellWithReuseIdentifier: "MikroqarzLifeCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        
        createNavigation()
        view.addSubview(collectionView)
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
        titleLabel.text = "Kreditlar"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .left
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "ipad"),
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
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            guard let index = CreditSectionType(rawValue: sectionIndex) else { return nil }
            
            switch index {
            
            case .onlineMikroqarz:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/1.119))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 5
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .mikroqarzLife:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/1.19))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                return section
            }
        }
        return layout
    }
}


extension CreditsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CreditSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = CreditSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
         
        case .onlineMikroqarz:
            return 1
        case .mikroqarzLife:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = CreditSectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
            
        case .onlineMikroqarz:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineMikroqarzsCell", for: indexPath) as! OnlineMikroqarzCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .mikroqarzLife:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MikroqarzLifeCell", for: indexPath) as! MikroqarzLifeCell
            cell.layer.cornerRadius = 10
            cell.backgroundColor = .white
            return cell
        }
    }
}



enum CreditSectionType: Int, CaseIterable {
    
    case onlineMikroqarz
    case mikroqarzLife
    
}
