//
//  EventBoardVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/1/24.
//

import UIKit

class EventBoardVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commonPostVC = CommonPostsVC(title: "이벤트")
        addChild(commonPostVC)
        view.addSubview(commonPostVC.view)
        commonPostVC.view.frame = view.bounds
        commonPostVC.didMove(toParent: self)
        
    }
}
