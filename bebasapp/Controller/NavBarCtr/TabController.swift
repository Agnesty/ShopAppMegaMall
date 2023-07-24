//
//  TabController.swift
//  bebasapp
//
//  Created by Agnes Triselia Yudia on 05/07/23.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    private func setupTabs() {
//        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
//        let shop = self.createNav(with: "Shop", and: UIImage(systemName: "shop"), vc: ShopViewController())
//        let account = self.createNav(with: "Account", and: UIImage(systemName: "person"), vc: AccountController())
//
//        self.setViewControllers([home, shop, account], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        
        return nav
    }

}
