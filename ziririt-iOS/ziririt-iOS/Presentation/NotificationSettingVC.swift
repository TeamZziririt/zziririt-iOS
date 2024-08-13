//
//  NotificationSettingVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/8/24.
//

import UIKit
import SnapKit

class NotificationSettingVC: UIViewController {

    // MARK: - Components

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "알림설정"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var switchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            postCommentNotificationView,
            postLikeNotificationView,
            commentReplyNotificationView,
            commentLikeNotificationView,
            streamerNoticeNotificationView
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var postCommentNotificationView: UIView = createNotificationView(title: "게시글 댓글 알림")
    private lazy var postLikeNotificationView: UIView = createNotificationView(title: "게시글 찌릿 알림")
    private lazy var commentReplyNotificationView: UIView = createNotificationView(title: "댓글 답글 알림")
    private lazy var commentLikeNotificationView: UIView = createNotificationView(title: "댓글 찌릿 알림")
    private lazy var streamerNoticeNotificationView: UIView = createNotificationView(title: "스트리머 공지 알림")

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setView()
        setupUI()
    }
    
    // MARK: - Methods
    
    private func createNotificationView(title: String) -> UIView {
        let view = UIView()
//        containerView.backgroundColor = .blue
        
        let label = UILabel()
        label.text = title
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        label.textColor = .white
        
        let switchButton = UISwitch()
        switchButton.isOn = true
        switchButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        view.addSubview(label)
        view.addSubview(switchButton)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        switchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(label)
        }
        
        return view
    }
    
    private func setView() {
        view.backgroundColor = .blackBackgroundColor
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(switchStackView)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        switchStackView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
