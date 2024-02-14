//
//  PayViewController.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 01/02/24.
//

import UIKit

class PayViewController: UIViewController {
    
    private let searchController = UISearchController()
    private lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(
            frame: CGRect(x: 15, y: 160, width: Int((UIScreen.main.bounds.width)) - 30, height: 280),
        collectionViewLayout: createLayout())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.layer.cornerRadius = 10
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemGray4
        
        title = "To'lovlar"
        view.addSubview(collectionView)
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Siz izlayotgan to'lov turi"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection? in
            
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 20, leading: 10, bottom: 0, trailing: 10)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/4))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        return layout
    }
    
}

extension PayViewController{
        func updateSearchResults(for searchController: UISearchController) {
            if (searchController.searchBar.text?.lowercased()) != nil {
                // Filter your data based on the searchText
                // Update your UI with the filtered results
            }
        }
    }


extension PayViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .orange
        
        return cell
    }
}



