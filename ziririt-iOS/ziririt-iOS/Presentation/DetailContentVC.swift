//
//  DetailContentVC.swift
//  ziririt-iOS
//
//  Created by Porori on 8/13/24.
//

import UIKit
import SnapKit
import RxSwift

final class DetailContentVC: UIViewController {
    
    // MARK: - Component
    private let header = HeaderViewComponent(style: .none, title: "개멋있는 정주연이다 게시판")
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.isScrollEnabled = true
        return scroll
    }()
    private let contentContainer = UIView()
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .pFont(style: .medium, size: 24)
        title.lineBreakMode = .byTruncatingTail
        title.numberOfLines = 2
        return title
    }()
    
    private lazy var userInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(profileImage)
        stack.addArrangedSubview(userStack)
        stack.addArrangedSubview(bookMarkButton)
        stack.addArrangedSubview(moreButton)
        stack.spacing = 8
        return stack
    }()
    
    private let userNicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .pFont(style: .medium, size: 14)
        return label
    }()
    
    private let postDateLabel: UILabel = {
        let label = UILabel()
        label.font = .pFont(style: .regular, size: 12)
        return label
    }()
    
    private lazy var userStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(userNicknameLabel)
        stack.addArrangedSubview(postDateLabel)
        return stack
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "lasso"), for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "lasso"), for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        return button
    }()
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person")
        profileImage.contentMode = .scaleAspectFit
        profileImage.backgroundColor = .orange
        return profileImage
    }()
    
    private let headerSpaceView = UIView()
    private let userSpaceView = UIView()
    
    // MARK: - Properties
    private let viewModel: DetailContentVM
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    init(viewModel: DetailContentVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpConstraint()
    }
    
    override func viewDidLayoutSubviews() {
        profileImage.layer.cornerRadius = self.profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
    
    private func bind() {
        header.leftBarButton.rx.tap
            .subscribe(onNext: {
                print("뒤돌아가기 버튼이 눌렸습니다.")
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func setUp() {
        view.backgroundColor = .green
        navigationController?.navigationBar.isHidden = true
        contentContainer.backgroundColor = .yellow
        
        headerSpaceView.backgroundColor = .red
        titleLabel.text = "치치직&아프리카 마피아 추리류 야생 스트리머 마크 서버 인원 모집중 어ㅣㅁㄴ어ㅣ먼오ㅓㅁ농ㅁ"
        
        userNicknameLabel.text = "유저닉네임"
        postDateLabel.text = "3분 전"
    }
    
    private func setUpConstraint() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentContainer)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(scrollView.snp.size)
        }
        
        contentContainer.addSubview(header)
        contentContainer.addSubview(headerSpaceView)
        contentContainer.addSubview(titleLabel)
        header.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        headerSpaceView.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.top.equalTo(header.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(headerSpaceView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentContainer.addSubview(userSpaceView)
        userSpaceView.backgroundColor = .blue
        contentContainer.addSubview(userInfoStack)
        
        userSpaceView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(16)
            make.leading.trailing.equalToSuperview()
        }
        userInfoStack.snp.makeConstraints { make in
            make.top.equalTo(userSpaceView.snp.bottom)
            make.height.equalTo(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        profileImage.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
    }
}
