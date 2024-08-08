//
//  ProfileSettingVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/8/24.
//

import UIKit
import SnapKit

class ProfileSettingVC: UIViewController {
    
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
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        return button
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_placeholder")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var profileImageChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("사진 변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임"
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var nickNameTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [backButton, titleLabel, confirmButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var profileImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, profileImageChangeButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var nickNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nickNameLabel, nickNameTextField])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupUI()
    }
    
    //MARK: - Methods
    
    private func setView() {
        view.backgroundColor = .blackBackgroundColor
        navigationController?.navigationBar.isHidden = true
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray
        ]
        
        nickNameTextField.attributedPlaceholder = NSAttributedString(string: "기존 닉네임", attributes: placeholderAttributes)
    }
    
    private func setupUI() {
        view.addSubview(headerStackView)
        view.addSubview(profileImageStackView)
        view.addSubview(nickNameStackView)
        
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        profileImageStackView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(128)
        }
        
        nickNameStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageStackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}


