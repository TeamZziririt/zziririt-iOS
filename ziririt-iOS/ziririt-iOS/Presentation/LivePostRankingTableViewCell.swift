//
//  LivePostRankingTableViewCell.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/26/24.
//

import UIKit

class LivePostRankingTableViewCell: UITableViewCell {
    
    static let identifier = "LivePostRankingTableViewCell"
    
    //MARK: - Components
    
    private lazy var postRankingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "follow_button_selected")
        return imageView
    }()
    
    private lazy var streamerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var postRankingAndImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postRankingLabel, postImageView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var postTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [streamerNameLabel, postTitleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var postTitleAndUserNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postTitleStackView, userNameLabel])
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
    }
    
    private func setView() {
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 15
    }
    
    private func setupUI() {
        contentView.addSubview(postRankingAndImageStackView)
        contentView.addSubview(postTitleAndUserNameStackView)
        
        postImageView.snp.makeConstraints { make in
            make.size.equalTo(43)
        }
        
        postRankingAndImageStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        postTitleAndUserNameStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(postRankingAndImageStackView.snp.trailing).offset(13)
        }
    }
    
    func configure(rankingNumber: Int, streamerName: String, postTitle: String, userName: String) {
        postRankingLabel.text = "\(rankingNumber)"
        streamerNameLabel.text = streamerName
        postTitleLabel.text = postTitle
        userNameLabel.text = userName
    }
}
