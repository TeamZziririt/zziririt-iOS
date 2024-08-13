//
//  HeaderViewComponent.swift
//  ziririt-iOS
//
//  Created by Porori on 8/10/24.
//

import UIKit
import SnapKit
import RxSwift

final class HeaderViewComponent: UIStackView {
    
    enum Style {
        case none
        case icon(UIImage?)
        case text(String)
        case optionalRight(String, String?)
    }
    
    let leftBarButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let rightBarButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let secondaryButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let leftContainerView = UIView()
    private let centerContainerView = UIView()
    private let rightContainerView = UIView()
    private let optionalContainerView = UIView()
    
    init(style: Style, title: String) {
        super.init(frame: .zero)
        setUpConstraint()
        setUp(style: style, title: title)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(style: Style, title: String) {
        leftBarButton.setImage(UIImage(named: "return_icon"), for: .normal)
        titleLabel.text = title
        titleLabel.font = .gFont(style: .bold, size: 18)
        switch style {
        
        // 비어있는 경우
        case .none:
            rightBarButton.setImage(nil, for: .normal)
            
        // 오른쪽 버튼에 아이콘만 있을 경우
        case .icon(let icon):
            rightBarButton.setImage(icon, for: .normal)
            
        // 오른쪽 버튼에 텍스트만 있을 경우
        case .text(let text):
            rightBarButton.setTitle(text, for: .normal)
            rightBarButton.setTitleColor(.black, for: .normal)
            rightBarButton.titleLabel?.font = .pFont(style: .medium, size: 15)
            rightBarButton.backgroundColor = UIColor.lightGray
            rightBarButton.layer.cornerRadius = 12
            rightBarButton.clipsToBounds = true
            
            rightBarButton.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalTo(55)
            }
            
        // 오른쪽에 두번째 버튼이 있을 경우
        case .optionalRight(let firstText, let secondText):
            rightBarButton.setTitle(firstText, for: .normal)
            rightBarButton.setTitleColor(.black, for: .normal)
            rightBarButton.titleLabel?.font = .pFont(style: .medium, size: 15)
            
            secondaryButton.setTitle(secondText, for: .normal)
            secondaryButton.setTitleColor(.white, for: .normal)
            secondaryButton.titleLabel?.font = .pFont(style: .medium, size: 15)
            
            rightBarButton.backgroundColor = UIColor.lightGray
            rightBarButton.layer.cornerRadius = 12
            rightBarButton.clipsToBounds = true
            
            rightBarButton.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalTo(55)
            }
            
            secondaryButton.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalTo(55)
            }
        }
    }
    
    private func setUpConstraint() {
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.distribution = .fillProportionally
        
        leftContainerView.addSubview(leftBarButton)
        centerContainerView.addSubview(titleLabel)
        rightContainerView.addSubview(rightBarButton)
        optionalContainerView.addSubview(secondaryButton)
        
        leftBarButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(32)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        secondaryButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(32)
        }
        
        rightBarButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(32)
        }
        addArrangedSubview(leftContainerView)
        addArrangedSubview(centerContainerView)
        addArrangedSubview(optionalContainerView)
        addArrangedSubview(rightContainerView)
    }
}
