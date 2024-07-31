//
//  settingVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/1/24.
//

import UIKit

class SettingVC: UIViewController {

    // MARK: - Components

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환경설정"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [notificationButton,profileButton,loginInfoButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var notificationButton: UIButton = createButton(title: "알림설정", imageName: "notification_image")
    private lazy var profileButton: UIButton = createButton(title: "프로필 설정", imageName: "profile_image")
    private lazy var loginInfoButton: UIButton = createButton(title: "로그인 정보", imageName: "information_image")

    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setView()
        setupUI()
    }
    
    // MARK: - Methods
    
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
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(buttonStackView)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
      
    }
}
