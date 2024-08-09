//
//  RecentVisitBoardTableViewCell.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/26/24.
//

import UIKit
import SnapKit

class RecentVisitBoardTableViewCell: UITableViewCell {

    static let identifier = "RecentVisitBoardTableViewCell"
        
    //MARK: - Components
    
    private lazy var streamerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .greenThemeColor
        return label
    }()
    
    private lazy var subscriberLabel: UILabel = {
        let label = UILabel()
        label.text = "구독자 수"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .grayFontColor
        return label
    }()
    
    private lazy var subscriberCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .grayFontColor
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "follow_button_normal"), for: .normal)
        return button
    }()
    
    private lazy var subscriberStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [subscriberLabel, subscriberCountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [streamerNameLabel, subscriberStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setView() {
        contentView.backgroundColor = .black
    }
    
    private func setupUI() {
        contentView.addSubview(infoStackView)
        contentView.addSubview(followButton)
        
        infoStackView.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
        }
        
        followButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.size.equalTo(27)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(streamerName: String, subscriberCount: String) {
        streamerNameLabel.text = streamerName
        subscriberCountLabel.text = subscriberCount
    }
}
