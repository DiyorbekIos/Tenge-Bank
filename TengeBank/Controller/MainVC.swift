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
        collectionView.backgroundColor = .systemGray6
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "storyCell")
        collectionView.register(BalanceCell.self, forCellWithReuseIdentifier: "balanceCell")
        collectionView.register(PaymentCardsCell.self, forCellWithReuseIdentifier: "paymentCardsCell")
        collectionView.register(TransferCell.self, forCellWithReuseIdentifier: "transferCell")
        collectionView.register(MyHomeCell.self, forCellWithReuseIdentifier: "myHomeCell")
        collectionView.register(TransactionHistoryCell.self, forCellWithReuseIdentifier: "transactionHistoryCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        createPersonButton()
        createBellButton()
        
        
        let label = UILabel()
        
        label.text = "Salom, Diyorbek"
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 90)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        label.font = .boldSystemFont(ofSize: 20)
        
        navigationItem.titleView = label
    }
    
    private func createPersonButton() {
        
        let personButton = UIButton(type: .system)
        personButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        personButton.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        personButton.tintColor = .appColor.primary
        personButton.addTarget(self, action: #selector(profileBtnPressed), for: .touchUpInside)
        
        let scaleDownTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        personButton.transform = scaleDownTransform
        
        navigationItem.leftBarButtonItem = .init(customView: personButton)
    }
    
    @objc private func profileBtnPressed() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    private func createBellButton() {
        
        let bellButton = UIButton(type: .system)
        
        bellButton.frame = CGRect(x:330, y: 40, width: 60, height: 60)
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .appColor.primary
        bellButton.addTarget(self, action: #selector(bellBtnPressed), for: .touchUpInside)
        
        let scaleDownTransform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        bellButton.transform = scaleDownTransform
        
        navigationItem.rightBarButtonItem = .init(customView: bellButton)
    }
    
    @objc private func bellBtnPressed() {
        navigationController?.pushViewController(MessageViewController(), animated: true)
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
                item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                
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
                section.orthogonalScrollingBehavior = .groupPagingCentered
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
            return 8
        case .balance:
            return 3
        case .paymentCards:
            return 8
        case .transfer:
            return 1
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
            guard  let cellType = StoryType(rawValue: indexPath.item),
                    let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "storyCell", for: indexPath
                  ) as? StoryCell
            else { return UICollectionViewCell() }
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            cell.prepare(type: cellType)
            return cell
            
        case .balance:
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "balanceCell", for: indexPath) as? BalanceCell else {return UICollectionViewCell() }
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            
            if indexPath.row == 2 { // masivni oxirgi elementiga tekshirishingiz kk
                cell.addCardMode()
                return cell
            }
            switch indexPath.row {
            case 0:
                cell.imageView.image = UIImage(named: "BalanceImage1")
            case 1:
                cell.imageView.image = UIImage(named: "BalanceImage2")
            
            default: break
               
            }
            return cell
            
        case .paymentCards:
            guard  let cellType = PaymentCardsType(rawValue: indexPath.item),
                    let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "paymentCardsCell", for: indexPath
                  ) as? PaymentCardsCell
            else { return UICollectionViewCell() }
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            cell.prepare(type: cellType)
            return cell
        case .transfer:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "transferCell", for: indexPath) as! TransferCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        case .myhome:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myHomeCell", for: indexPath) as! MyHomeCell
            
            cell.delegate = self
            
            switch indexPath.row {
            case 0:
                cell.imageView.image = UIImage(named: "MyHomeCellImage1")
                cell.label1.text = "Mening uyim"
                cell.label2.text = "Komunal to'lovlarni osonroq to'lang"
                cell.button.setTitle("Batafsil", for: .normal)
                cell.button.setTitleColor(.white, for: .normal)

            case 1:
                cell.imageView.image = UIImage(named: "MyHomeCellImage2")
                cell.label1.text = "Foydali mikroqarz"
                cell.label2.text = "Qulay shartlarga ega tezkor onlayn mikroqarz, eng!"
                cell.button.setTitle("Batafsil", for: .normal)
                cell.button.setTitleColor(.white, for: .normal)

            case 2:
                cell.imageView.image = UIImage(named: "MyHomeCellImage3")
                cell.label1.text = "Qulay omonat"
                cell.label2.text = " Yillik 23% stavkali qulay omonatni oching"
                cell.button.setTitle("Batafsil", for: .normal)
                cell.button.setTitleColor(.white, for: .normal)
    
            default:
                break
            }
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            
            
            return cell
        case .transactionHistory:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "transactionHistoryCell", for: indexPath) as! TransactionHistoryCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else { return }
        
        switch sectionType {
            
        case .story:
            print(sectionType)
        case .balance:
            print(sectionType)
        case .paymentCards:
            switch indexPath.item {
            case 0:
                navigationController?.pushViewController(CardsViewController(), animated: true)
            case 1:
                navigationController?.pushViewController(OtkazmalarViewController(), animated: true)
            case 2:
                navigationController?.pushViewController(PayViewController(), animated: true)
            case 3:
                break
            case 4:
                navigationController?.pushViewController(ExchangeViewController(), animated: true)
            case 5:
                navigationController?.pushViewController(CreditsViewController(), animated: true)
            case 6:
                navigationController?.pushViewController(QRPaymentViewController(), animated: true)
            case 7:
                navigationController?.pushViewController(MeningArizalarimViewController(), animated: true)
            default:
                break
            }
            
        case .transfer:
            print(sectionType)
        case .myhome:
            switch indexPath.item {
            case 0:
                break
            case 1:
                navigationController?.pushViewController(CreditsViewController(), animated: true)
            case 2:
                navigationController?.pushViewController(OmonatViewController(), animated: true)
            default:
                break
            }
            
        case .transactionHistory:
            print(sectionType)
        }
    }
}


extension MainVC: HomeCellDelegate {
    func didPressedMore(_ type: HomeCellType) {
        switch type {
        case .home:
            break
        case .loan:
            break
        case .depozit:
            break
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
