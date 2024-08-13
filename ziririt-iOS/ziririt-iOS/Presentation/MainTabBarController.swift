//
//  MainTabBarController.swift
//  ziririt-iOS
//
//  Created by Porori on 8/9/24.
//

import UIKit
import SnapKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Component
    
    private let tabBarComponent = TabBarComponent()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectCustomTabBar()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        addTabItem()
        setupUI()
    }
    
    // MARK: - Methods
    
    /// 뷰 컨트롤을 등록합니다
    private func addTabItem() {
        let vc1 = UINavigationController(rootViewController: UIViewController())
        let vc2 = UINavigationController(rootViewController: UIViewController())
        let vc3 = UINavigationController(rootViewController: UIViewController())
        let profilePage = UINavigationController(rootViewController: MyPageVC())
        vc1.view.backgroundColor = .green
        vc2.view.backgroundColor = .red
        vc3.view.backgroundColor = .blue
        
        setViewControllers([vc1, vc2, vc3, profilePage], animated: true)
    }
    
    private func setupUI() {
        tabBar.isHidden = true
        view.addSubview(tabBarComponent)
                
        tabBarComponent.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    /// tabBar Component의 역할을 맡도록 지정합니다
    private func connectCustomTabBar() {
        tabBarComponent.delegate = self
    }
}

extension MainTabBarController: TabBarComponentDelegate {
    func tabBarComponent(_ tabBar: TabBarComponent, didSelectTabAt index: Int) {
        selectedIndex = index
    }
}
