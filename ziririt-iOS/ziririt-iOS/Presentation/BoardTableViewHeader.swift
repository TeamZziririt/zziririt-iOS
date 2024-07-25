//
//  BoardTableViewHeader.swift
//  ziririt-iOS
//
//  Created by Porori on 7/25/24.
//

import UIKit
import SnapKit

final class BoardTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Components
    
    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    // MARK: - Properties
    
    static let identifier = "BoardTableViewHeader"
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setTitle(title: String) {
        self.title.text = title
        self.title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        self.title.textColor = .white
    }
    
    private func setUpConstaints() {
        contentView.addSubview(title)
        title.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
