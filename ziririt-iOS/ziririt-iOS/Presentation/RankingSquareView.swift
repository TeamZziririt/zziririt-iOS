//
//  RankingSquareView.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/30/24.
//

import UIKit
import SnapKit

class RankingSquareView: UIView {
    
    // MARK: - Components
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "GMarketSansTTFBold", size: 16)
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupView()
    }
    
    // MARK: - Methods
    
    private func setupView() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    private func setupUI() {
        addSubview(numberLabel)
        
        numberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setNumber(_ number: Int) {
        numberLabel.text = "\(number)"
        
        if 1...5 ~= number {
            numberLabel.textColor = .black
            self.backgroundColor = .systemGreen
        } else {
            numberLabel.textColor = .white
            self.backgroundColor = .darkGray
        }
    }
}
