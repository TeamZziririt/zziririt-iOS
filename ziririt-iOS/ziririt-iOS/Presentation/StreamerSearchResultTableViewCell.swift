//
//  StreamerSearchResultTableViewCell.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/30/24.
//

import UIKit

class StreamerSearchResultTableViewCell: UITableViewCell {

    static let identifier = "StreamerSearchResultTableViewCell"
    
    //MARK: - Components
    
    private lazy var rankingImageView: RankingSquareView = {
        let imageView = RankingSquareView()
        return imageView
    }()
    
    private lazy var streamerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var resultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rankingImageView, streamerNameLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
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
    }
    
    private func setupUI() {
        contentView.addSubview(resultStackView)
        
        rankingImageView.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
        
        resultStackView.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
    }
    
    func configure(number: Int, name: String) {
        rankingImageView.setNumber(number)
        streamerNameLabel.text = name
    }

}
