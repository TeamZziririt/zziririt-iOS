//
//  BoardRankTableViewCell.swift
//  ziririt-iOS
//
//  Created by Porori on 7/25/24.
//

import UIKit
import SnapKit

final class NoticeBoardTableViewCell: UITableViewCell {
    
    static let identifier = "NoticeBoardTableViewCell"
    
    private lazy var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(rankImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
        return stackView
    }()
    
    private let rankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Info_fill")
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "공지사항"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "05.11"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContents(image: UIImage?, text: String) {
        self.imageView?.image = image
    }
    
    private func setUp() {
        contentView.backgroundColor = .darkGray
        titleLabel.textColor = .white
        dateLabel.textColor = .white
    }
    
    private func setUpConstraint() {
        contentView.addSubview(containerStack)
        containerStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        rankImageView.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
    }
}
