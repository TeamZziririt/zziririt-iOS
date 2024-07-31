//  MyPageVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/30/24.
//

import UIKit
import SnapKit

class MyPageVC: UIViewController {
    // MARK: - Components
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_placeholder")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "유저닉네임임"
        label.font = UIFont(name: "GmarketSansTTFBold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "setting_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    private lazy var myZziriritLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 찌리릿"
        label.font = UIFont(name: "GmarketSansTTFBold", size: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var zziriritNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "찌리릿 소식"
        label.font = UIFont(name: "GmarketSansTTFBold", size: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var postsButton: UIButton = createButton(title: "내가 작성한 게시글", imageName: "posts_image")
    private lazy var commentsButton: UIButton = createButton(title: "내가 작성한 댓글", imageName: "comments_image")
    private lazy var likedPostsButton: UIButton = createButton(title: "내가 찌리릿한 게시글", imageName: "liked_posts_image")
    private lazy var likedCommentsButton: UIButton = createButton(title: "내가 찌리릿한 댓글", imageName: "liked_comments_image")
    
    private lazy var notificationsButton: UIButton = createButton(title: "공지사항", imageName: "notifications_image")
    private lazy var eventsButton: UIButton = createButton(title: "이벤트", imageName: "events_image")
    private lazy var iconShopButton: UIButton = createButton(title: "아이콘샵", imageName: "icon_shop_image")
    
    private lazy var policyButton: UIButton = createButton(title: "약관 및 정책", imageName: nil)
    private lazy var reportButton: UIButton = createButton(title: "건의 / 신고", imageName: nil)
    
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
        view.addSubview(scrollView)
        
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(settingsButton)
        scrollView.addSubview(myZziriritLabel)
        scrollView.addSubview(postsButton)
        scrollView.addSubview(commentsButton)
        scrollView.addSubview(likedPostsButton)
        scrollView.addSubview(likedCommentsButton)
        scrollView.addSubview(zziriritNewsLabel)
        scrollView.addSubview(notificationsButton)
        scrollView.addSubview(eventsButton)
        scrollView.addSubview(iconShopButton)
        scrollView.addSubview(policyButton)
        scrollView.addSubview(reportButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
            make.size.equalTo(128)
        }

        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.centerX.equalTo(scrollView.frameLayoutGuide)
        }

        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide).offset(16)
            make.trailing.equalTo(scrollView.frameLayoutGuide).inset(16)
            make.size.equalTo(24)
        }

        myZziriritLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        postsButton.snp.makeConstraints { make in
            make.top.equalTo(myZziriritLabel.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        commentsButton.snp.makeConstraints { make in
            make.top.equalTo(postsButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        likedPostsButton.snp.makeConstraints { make in
            make.top.equalTo(commentsButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        likedCommentsButton.snp.makeConstraints { make in
            make.top.equalTo(likedPostsButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        zziriritNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(likedCommentsButton.snp.bottom).offset(24)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        notificationsButton.snp.makeConstraints { make in
            make.top.equalTo(zziriritNewsLabel.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        eventsButton.snp.makeConstraints { make in
            make.top.equalTo(notificationsButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        iconShopButton.snp.makeConstraints { make in
            make.top.equalTo(eventsButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        policyButton.snp.makeConstraints { make in
            make.top.equalTo(iconShopButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
        }
        
        reportButton.snp.makeConstraints { make in
            make.top.equalTo(policyButton.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.contentLayoutGuide).offset(8)
            make.bottom.equalTo(scrollView.contentLayoutGuide).offset(-16)
        }
    }
}
