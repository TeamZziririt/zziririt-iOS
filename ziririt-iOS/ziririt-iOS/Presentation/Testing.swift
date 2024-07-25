//
//  Testing.swift
//  ziririt-iOS
//
//  Created by Porori on 7/25/24.
//

import UIKit
import SnapKit
import RxSwift

class Testing: UIViewController {
    let segment = ["이름", "나이"]
    
    lazy var test = CustomSegmentComponent(segments: self.segment, selectedSegment: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(test)
        
        test.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(127)
        }
    }
}
