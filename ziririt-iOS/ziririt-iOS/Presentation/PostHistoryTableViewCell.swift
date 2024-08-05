//
//  MyPostsTableViewCell.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/31/24.
//

import UIKit
import SnapKit

class PostHistoryTableViewCell: UITableViewCell {
    
    static let identifier = "PostHistoryTableViewCell"
    
    // MARK: - Components
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = .grayFontColor
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var createdAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = .grayFontColor
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var commentCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = .greenThemeColor
        return label
    }()
    
    private lazy var titleAndCommentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, commentCountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var nameAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, createdAtLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var postInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleAndCommentStackView, nameAndDateStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var divideLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayContentBackgroundColor
        return view
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        addSubview(postInfoStackView)
        addSubview(thumbnailImageView)
        
        postInfoStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        thumbnailImageView.snp.makeConstraints { make in
            make.centerY.equalTo(postInfoStackView)
            make.trailing.equalToSuperview().inset(16)
            make.size.equalTo(44)
        }
    }
    
    func configure(title: String, UserName: String, createdAt: String, commentCount: String, thumbnailImage: UIImage?) {
        titleLabel.text = title
        userNameLabel.text = UserName
        createdAtLabel.text = createdAt
        commentCountLabel.text = commentCount
        thumbnailImageView.image = thumbnailImage
    }
}
