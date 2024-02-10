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
        collectionViewLayout: UICollectionViewLayout())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGray3
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.layer.cornerRadius = 10
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        title = "To'lovlar"
        view.addSubview(collectionView)
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Siz izlayotgan to'lov turi"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
}



