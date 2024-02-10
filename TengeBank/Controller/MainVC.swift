//
//  MainVC.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 02/02/24.
//

import UIKit

final class MainVC: UIViewController {
    
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: UIScreen.main.bounds,
            collectionViewLayout: createLayout()
        )
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray3
    
        
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell4")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell5")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell6")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        createPersonButton()
        createBellButton()
        
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "Salom, Diyorbek"
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 90)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        
        ])
        
        label.font = .boldSystemFont(ofSize: 20)
        
    }
    
    private func createPersonButton() {
        
        let personButton = UIButton()
        personButton.frame = CGRect(x: 15, y: 40, width: 60, height: 60)
        personButton.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        personButton.tintColor = .appColor.primary
        
        personButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let scaleDownTransform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        personButton.transform = scaleDownTransform
        
        view.addSubview(personButton)
    }
    
    private func createBellButton() {
        
        let bellButton = UIButton(type: .system)
        view.addSubview(bellButton)
        bellButton.frame = CGRect(x:330, y: 40, width: 60, height: 60)
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .appColor.primary
        
        let scaleDownTransform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        bellButton.transform = scaleDownTransform
    }
    
    @objc func buttonTapped() {
        // Tugma bosilganda ishga tushmasi yaratish uchun kodlar
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            guard let index = HomeSectionType(rawValue: sectionIndex) else { return nil }
            
            switch index {
            case .story:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .balance:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .paymentCards:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/4))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            
            case .transfer:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //            section.interGroupSpacing = 10
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .myhome:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 5
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            case .transactionHistory:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                    .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/5))
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




extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        HomeSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .story:
            return  8
        case .balance:
            return 4
        case .paymentCards:
            return 8
        case .transfer:
            return  1
        case .myhome:
            return 3
        case .transactionHistory:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .story:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoryCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            switch indexPath.row {
            case 0:
                cell.imageView.image = UIImage(named:"image1")
            case 1:
                cell.imageView.image = UIImage(named:"image2")
            case 2:
                cell.imageView.image = UIImage(named:"image3")
            case 3:
                cell.imageView.image = UIImage(named:"image4")
            case 4:
                cell.imageView.image = UIImage(named:"image5")
            case 5:
                cell.imageView.image = UIImage(named:"image6")
            case 6:
                cell.imageView.image = UIImage(named:"image7")
            case 7:
                cell.imageView.image = UIImage(named:"image8")
            default:
                return StoryCell()
            }
            
            return cell
            
        case .balance:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
            
        case .paymentCards:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .transfer:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .myhome:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .transactionHistory:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell6", for: indexPath)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        }
    }
}

enum HomeSectionType: Int, CaseIterable {
    case story
    case balance
    case paymentCards
    case transfer
    case myhome
    case transactionHistory
}
