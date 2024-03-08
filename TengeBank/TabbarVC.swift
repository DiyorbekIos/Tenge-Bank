//
//  TabbarVC.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 01/02/24.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTabBar()
    }
    
    
    private func prepareTabBar() {

        
        let profile = MainVC()
        let profileVC = UINavigationController(rootViewController: profile)
        profileVC.tabBarItem.title = "Asosiy"
        profileVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let hisob = HisobRaqamViewController()
        let hisobVC = UINavigationController(rootViewController: hisob)
        hisobVC.tabBarItem.title = "Hisob raqam"
        hisobVC.tabBarItem.image = UIImage(systemName: "creditcard")
        
        let transfer = TransferViewController()
        let transferVC = UINavigationController(rootViewController: transfer)
        transferVC .tabBarItem.title = "O'tkazmalar"
        transferVC .tabBarItem.image = UIImage(systemName: "arrow.left.arrow.right")
        
        let pay = PayViewController()
        let payVC = UINavigationController(rootViewController: pay)
        payVC.tabBarItem.title = "To'lovlar"
        payVC.tabBarItem.image = UIImage(systemName: "archivebox")
        
        let again = AgainViewController()
        let againVC = UINavigationController(rootViewController: again)
        againVC.tabBarItem.title = "Yana"
        againVC.tabBarItem.image = UIImage(systemName: "line.3.horizontal")


        
        viewControllers = [profileVC,hisobVC,transferVC,payVC,againVC]
        selectedIndex = 3
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.init(named: "white")?.cgColor
        tabBar.unselectedItemTintColor = UIColor.systemGray
    
        
        UITabBar.appearance().tintColor = .appColor.primary
    }
}

