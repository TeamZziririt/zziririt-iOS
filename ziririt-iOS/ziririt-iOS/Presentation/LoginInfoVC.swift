//
//  LoginInfoVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/9/24.
//

import UIKit
import SnapKit

class LoginInfoVC: UIViewController {
    
    // MARK: - Components

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 정보"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var deleteAccountButton: UIButton = createButton(title: "회원탈퇴", imageName: "cancel_image")
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupUI()
    }
    
    //MARK: - Methods
    
    private func createButton(title: String, imageName: String?) -> UIButton {
        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = .white
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "Pretendard-Medium", size: 16)
            return outgoing
        }

        if let imageName = imageName, let image = UIImage(named: imageName) {
            configuration.image = image
            configuration.imagePadding = 8
        }

        let button = UIButton(configuration: configuration)
        return button
    }
    
    private func setView() {
        view.backgroundColor = .blackBackgroundColor
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(deleteAccountButton)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        deleteAccountButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
    }
}
