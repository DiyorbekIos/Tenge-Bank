//
//  AsosiyViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 31/01/24.
//

import UIKit

class HisobRaqamViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: UIScreen.main.bounds,
            collectionViewLayout: createLayout()
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray6
        
        collectionView.register(KartaCell.self, forCellWithReuseIdentifier: "KartaCell")
        collectionView.register(OmonatCell.self, forCellWithReuseIdentifier: "OmonatCell")
        collectionView.register(HisobRaqamCell.self, forCellWithReuseIdentifier: "HisobRaqamCell")
        collectionView.register(KreditCell.self, forCellWithReuseIdentifier: "KreditCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        title = "Hisob raqam"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            guard let index = HisobRaqamSectionType(rawValue: sectionIndex) else { return nil }
            
            switch index {
                
            case .cards, .omonat, .credit:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(350))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
                
            case .hisobRaqam:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
                return section
            }
        }
        return layout
    }
}

extension HisobRaqamViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HisobRaqamSectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = HisobRaqamSectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .cards, .omonat, .hisobRaqam, .credit:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = HisobRaqamSectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .cards:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KartaCell", for: indexPath) as! KartaCell
            cell.button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
            cell.button.setTitle("Kartani qo'shish", for: .normal)
            cell.button2.setTitle("Ko'proq ko'rsatish", for: .normal)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
            
        case .omonat:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OmonatCell", for: indexPath) as! OmonatCell
            cell.imageView.image = UIImage(named: "Omonat")
            cell.button.setTitle("Ochish", for: .normal)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
            
        case .hisobRaqam:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HisobRaqamCell", for: indexPath) as! HisobRaqamCell
            cell.button.setTitle("Hisob ochish", for: .normal)
            cell.button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
            cell.button2.setTitle("Ko'proq ko'rsatish", for: .normal)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
            
        case .credit:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KreditCell", for: indexPath) as! KreditCell
            cell.imageView.image = UIImage(named: "Kredit")
            cell.button.setTitle("Ochish", for: .normal)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let sectionType = HisobRaqamSectionType(rawValue: indexPath.section) else { return .zero }
        
        switch sectionType {
        case .cards, .omonat, .hisobRaqam, .credit:
            let width = collectionView.bounds.width - 20
            let itemWidth = width / 3 - 20
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
}

enum HisobRaqamSectionType: Int, CaseIterable {
    case cards
    case omonat
    case hisobRaqam
    case credit
}
