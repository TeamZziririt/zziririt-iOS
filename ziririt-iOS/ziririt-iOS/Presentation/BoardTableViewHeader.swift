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
    
    private let segmentButton: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.backgroundColor = .clear
        segment.insertSegment(withTitle: "최신 순", at: 0, animated: true)
        segment.insertSegment(withTitle: "인기 순", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        return segment
    }()

    // MARK: - Properties
    
    static let identifier = "BoardTableViewHeader"
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setUp() {
        segmentButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ], for: .normal)
        
        segmentButton.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.green,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ], for: .selected)
        
        segmentButton.selectedSegmentTintColor = .clear
        segmentButton.backgroundColor = .clear
    }
    
    private func setUpConstaints() {
        contentView.addSubview(segmentButton)
        segmentButton.snp.makeConstraints { make in
            make.width.equalTo(110)
        }
    }
}
