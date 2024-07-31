//
//  NoticeBoardVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/1/24.
//

import UIKit

class NoticeBoardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commonPostVC = CommonPostsVC(title: "공지사항")
        addChild(commonPostVC)
        view.addSubview(commonPostVC.view)
        commonPostVC.view.frame = view.bounds
        commonPostVC.didMove(toParent: self)
    }
}
