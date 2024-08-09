//
//  MainTabBarController.swift
//  ziririt-iOS
//
//  Created by Porori on 8/9/24.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    private let tabBarComponent = TabBarComponent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTabItem()
        connectCustomTabBar()
    }
    
    func addTabItem() {
        let vc1 = UINavigationController(rootViewController: UIViewController())
        let vc2 = UINavigationController(rootViewController: UIViewController())
        let vc3 = UINavigationController(rootViewController: UIViewController())
        let vc4 = UINavigationController(rootViewController: UIViewController())
        vc1.view.backgroundColor = .blue
        vc2.view.backgroundColor = .red
        vc3.view.backgroundColor = .blue
        vc4.view.backgroundColor = .green
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
    private func setupUI() {
        tabBar.isHidden = true
        view.addSubview(tabBarComponent)
                
        tabBarComponent.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func connectCustomTabBar() {
        tabBarComponent.delegate = self
    }
}

extension MainTabBarController: TabBarComponentDelegate {
    func tabBarComponent(_ tabBar: TabBarComponent, didSelectTabAt index: Int) {
        selectedIndex = index
    }
}
