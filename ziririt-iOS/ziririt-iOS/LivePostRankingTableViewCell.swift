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
    
    private lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "follow_button_selected")
        return imageView
    }()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupUI() {
        contentView.layer.cornerRadius = 15
    }

}
