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
        return scroll
    }()
    private let detailContentContainer = UIView()
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .pFont(style: .medium, size: 24)
        title.lineBreakMode = .byTruncatingTail
        title.numberOfLines = 2
        title.textColor = .white
        return title
    }()
    
    // 별도 컴포넌트화 진행 예정
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
        label.textColor = .white
        return label
    }()
    
    private let postDateLabel: UILabel = {
        let label = UILabel()
        label.font = .pFont(style: .regular, size: 12)
        label.textColor = .white
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
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "meatballs_menu"), for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        return button
    }()
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "profile_placeholder")
        profileImage.contentMode = .scaleAspectFit
        profileImage.backgroundColor = .orange
        return profileImage
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .vertical)
        label.font = .pFont(style: .medium, size: 13)
        label.textColor = .white
        return label
    }()
    
    private let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16)
        stack.addArrangedSubview(contentLabel)
        stack.addArrangedSubview(contentImageView)
        return stack
    }()
    
    let likeButton = likeButtonComponent()
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
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        profileImage.layer.cornerRadius = self.profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
    
    private func bind() {
        let input = DetailContentVM.Input(
            returnToRoot: header.leftBarButton.rx.tap,
            profileActionTapped: bookMarkButton.rx.tap,
            profileSecondaryTapped: moreButton.rx.tap,
            actionButtonTapped: likeButton.imageButtonView.rx.tap
        )
        let output = viewModel.transform(input: input)
        
        output.title
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
                
        output.dateValue
            .bind(to: postDateLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.userName
            .bind(to: userNicknameLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.content
            .bind(to: contentLabel.rx.text)
            .disposed(by: disposeBag)

        output.returnToRoot
            .subscribe(onNext: {
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        output.bookmarkTapped
            .subscribe(onNext: {
                print("북마크 버튼이 눌렸습니다.")
            })
            .disposed(by: disposeBag)
        
        output.editTapped
            .subscribe(onNext: {
                print("더보기 버튼이 눌렸습니다.")
            })
            .disposed(by: disposeBag)
    }
    
    private func setUp() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // 컴포넌트화 진행하며 stackView 정리 진행
    private func setUpConstraint() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailContentContainer)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        detailContentContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(scrollView.snp.size)
        }
        
        detailContentContainer.addSubview(header)
        detailContentContainer.addSubview(headerSpaceView)
        detailContentContainer.addSubview(titleLabel)
        detailContentContainer.addSubview(contentStack)
        header.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        headerSpaceView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(headerSpaceView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        detailContentContainer.addSubview(userSpaceView)
        detailContentContainer.addSubview(userInfoStack)
        
        userSpaceView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(16)
            make.leading.trailing.equalToSuperview()
        }
        
        userInfoStack.snp.makeConstraints { make in
            make.top.equalTo(userSpaceView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        profileImage.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
        
        contentStack.snp.makeConstraints { make in
            make.top.equalTo(userInfoStack.snp.bottom)
            make.height.equalTo(489) // 임의 고정 값
            make.leading.trailing.equalToSuperview()
        }
        
        detailContentContainer.addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentStack.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
