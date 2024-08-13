//
//  MyCommentsVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/1/24.
//

import UIKit

class CommentHistoryVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commonPostVC = CommonMypageBoardVC(title: "내가 작성한 댓글")
        addChild(commonPostVC)
        view.addSubview(commonPostVC.view)
        commonPostVC.view.frame = view.bounds
        commonPostVC.didMove(toParent: self)
    }
}
