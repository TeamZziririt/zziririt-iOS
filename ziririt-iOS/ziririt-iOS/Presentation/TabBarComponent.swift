//
//  TabBarController.swift
//  ziririt-iOS
//
//  Created by Porori on 8/2/24.
//

import UIKit
import RxSwift
import SnapKit

protocol TabBarComponentDelegate: AnyObject {
    func tabBarComponent(_ tabBar: TabBarComponent, didSelectTabAt index: Int)
}

class TabBarComponent: UIStackView {
    
    enum TabBarStatus: Int {
        case home = 0
        case community
        case search
        case profile
    }
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        return stack
    }()
    
    let homeIcon: UIButton = {
        let imageView = UIButton()
        return imageView
    }()
    
    let communityIcon: UIButton = {
        let imageView = UIButton()
        return imageView
    }()
    
    let searchIcon: UIButton = {
        let imageView = UIButton()
        return imageView
    }()
    
    let profileIcon: UIButton = {
        let imageView = UIButton()
        return imageView
    }()
    
    private var tabButtons: [UIButton] = []
    private let topSpaceView = UIView()
    private let bottomSpaceView = UIView()
    
    private let disposeBag = DisposeBag()
    weak var delegate: TabBarComponentDelegate?
    
    init() {
        super.init(frame: .zero)
        setUp()
        setUpConstraint()
        bind()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        for (index, button) in tabButtons.enumerated() {
            button.rx.tap
                .subscribe(onNext: { [weak self] in
                    guard let self = self else { return }
                    print("어떤 버튼 탭?\(index)")
                    self.delegate?.tabBarComponent(self, didSelectTabAt: index)
                })
                .disposed(by: disposeBag)
        }
    }
    
    private func setUp() {
        self.axis = .vertical
        self.backgroundColor = .black
        self.tabButtons = [homeIcon, communityIcon, searchIcon, profileIcon]
        
        homeIcon.setImage(UIImage(named: "home"), for: .normal)
        communityIcon.setImage(UIImage(named: "file_edit"), for: .normal)
        searchIcon.setImage(UIImage(named: "carbon_search"), for: .normal)
        profileIcon.setImage(UIImage(named: "user_profile"), for: .normal)
    }
    
    private func setUpConstraint() {
        horizontalStack.addArrangedSubview(homeIcon)
        horizontalStack.addArrangedSubview(communityIcon)
        horizontalStack.addArrangedSubview(searchIcon)
        horizontalStack.addArrangedSubview(profileIcon)
        
        self.addArrangedSubview(topSpaceView)
        self.addArrangedSubview(horizontalStack)
        self.addArrangedSubview(bottomSpaceView)
        
        topSpaceView.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        bottomSpaceView.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        horizontalStack.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
}