//
//  likeButtonComponent.swift
//  ziririt-iOS
//
//  Created by Porori on 8/17/24.
//

import UIKit
import RxSwift
import SnapKit

final class likeButtonComponent: UIStackView {
    
    enum ButtonState {
        case tapped
        case untapped
        
        var imageStatus: UIImage? {
            switch self {
            case .tapped:
                return UIImage(systemName: "heart.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal)
            case .untapped:
                return UIImage(systemName: "heart.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
            }
        }
    }
    
    //MARK: - Component
    
    let imageButtonView: UIButton = {
        let imageButton = UIButton()
        imageButton.setImage(
            UIImage(
                systemName: "heart.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal),
                for: .normal)
        imageButton.backgroundColor = .darkGray
        imageButton.imageEdgeInsets = UIEdgeInsets(top: 9, left: 0, bottom: 9, right: 0)
        return imageButton
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "0명이 찌릿 했어요!"
        label.textColor = .white
        label.font = .gFont(style: .bold, size: 14)
        return label
    }()
    
    //MARK: - Properties
    
    private var currentState: ButtonState = .untapped
    private var tapCount: Int = 0
    private let disposeBag = DisposeBag()
    let buttonStateObserver: PublishSubject<ButtonState> = .init()
    
    //MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUp()
        setUpConstraint()
        bind()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageButtonView.layer.cornerRadius = imageButtonView.frame.width / 2
        imageButtonView.clipsToBounds = true
    }
    
    private func bind() {
        imageButtonView.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                owner.currentState = owner.currentState == .untapped ? .tapped : .untapped
                owner.buttonStateObserver.onNext(owner.currentState)
            }
            .disposed(by: disposeBag)
        
        buttonStateObserver
            .subscribe(onNext: { state in
                self.updateView(state: state)
            })
            .disposed(by: disposeBag)
    }
    
    /// 상태에 따라 view를 업데이트 합니다
    /// - Parameter state: ButtonState 타입을 받습니다
    private func updateView(state: ButtonState) {
        switch state {
        case .tapped:
            self.tapCount += 1
            self.imageButtonView.setImage(state.imageStatus, for: .normal)
        case .untapped:
            self.tapCount -= 1
            self.imageButtonView.setImage(state.imageStatus, for: .normal)
        }
        noticeLabel.text = "\(self.tapCount)명이 찌릿 했어요!"
    }
    
    private func setUp() {
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
        self.spacing = 8
        
        imageButtonView.contentVerticalAlignment = .fill
        imageButtonView.contentHorizontalAlignment = .fill
    }
    
    private func setUpConstraint() {
        addArrangedSubview(imageButtonView)
        addArrangedSubview(noticeLabel)
        
        imageButtonView.snp.makeConstraints { make in
            make.size.equalTo(64)
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
}
