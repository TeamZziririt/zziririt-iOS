//
//  MyLikedCommentsVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/1/24.
//

import UIKit

class MyLikedCommentsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commonPostVC = CommonMypageBoardVC(title: "내가 찌리릿한 댓글")
        addChild(commonPostVC)
        view.addSubview(commonPostVC.view)
        commonPostVC.view.frame = view.bounds
        commonPostVC.didMove(toParent: self)
    }
}
