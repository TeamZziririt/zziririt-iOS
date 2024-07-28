//
//  CustomSegmentComponent.swift
//  ziririt-iOS
//
//  Created by Porori on 7/25/24.
//

import UIKit
import SnapKit

class CustomSegmentComponent: UISegmentedControl {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Line 1")
        imageView.isHidden = true
        self.addSubview(imageView)
        return imageView
    }()
    
    init(segments: [String], selectedSegment: Int? = 0) {
        super.init(frame: .zero)
        setUp(segments: segments, selected: selectedSegment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        let finalPosition = segmentWidth * CGFloat(selectedSegmentIndex)
        
        self.imageView.snp.updateConstraints { make in
            make.leading.equalTo(finalPosition)
            make.size.equalTo(24)
        }
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
            self.layoutIfNeeded()
        }
    }
    
    func setUp(segments: [String], selected: Int?) {
        self.removeAllSegments()
        for (index, segment) in segments.enumerated() {
            self.insertSegment(withTitle: segment, at: index, animated: false)
        }
        self.selectedSegmentIndex = selected ?? 0
        imageView.isHidden = false
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ], for: .normal)
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.green,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ], for: .selected)
        
        self.selectedSegmentTintColor = .clear
    }
}
