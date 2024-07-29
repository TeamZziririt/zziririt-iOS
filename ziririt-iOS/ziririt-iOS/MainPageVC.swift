//
//  MainPageVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/25/24.
//

import UIKit
import SnapKit
import RxSwift

// 전체 뷰 - 스크롤 뷰

// 최근 방문한 게시판 - 테이블 뷰
// 최근 방문한 내역이 없을 시 별도의 안내(뷰) 표시
// 테이블 뷰 셀 데이터 - 스트리머 이름, 구독자 수, 팔로우 유무

// 스트리머 게시글 랭킹 - 테이블 뷰
// 테이블 뷰 셀 데이터 - 스트리머 이미지, 게시글 제목, 작성자 닉네임
// 순위는 좋아요 순서로...


class MainPageVC: UIViewController {

    //MARK: - Component
    
    let scrollView = UIScrollView()
    
    private lazy var recentVisitBoardButton : UIButton = {
        let button = UIButton()
        button.setTitle("최근 방문한 게시판", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .clear
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    private lazy var recentVisitBoardTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(RecentVisitBoardTableViewCell.self, forCellReuseIdentifier: RecentVisitBoardTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var livePostRankingButton : UIButton = {
        let button = UIButton()
        button.setTitle("실시간 게시글 랭킹", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .clear
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    private lazy var livePostRankingTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(LivePostRankingTableViewCell.self, forCellReuseIdentifier: LivePostRankingTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = .clear
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(recentVisitBoardButton)
        scrollView.addSubview(recentVisitBoardTableView)
        scrollView.addSubview(livePostRankingButton)
        scrollView.addSubview(livePostRankingTableView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        recentVisitBoardButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().inset(16)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
        }
        
        recentVisitBoardTableView.snp.makeConstraints { make in
            make.top.equalTo(recentVisitBoardButton.snp.bottom).offset(4)
            make.width.equalToSuperview().inset(16)
            make.height.equalTo(220)
            make.centerX.equalToSuperview()
        }
        
        livePostRankingButton.snp.makeConstraints { make in
            make.top.equalTo(recentVisitBoardTableView.snp.bottom).offset(4)
            make.width.equalToSuperview().inset(16)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
        }
        
        livePostRankingTableView.snp.makeConstraints { make in
            make.top.equalTo(livePostRankingButton.snp.bottom).offset(4)
            make.width.equalToSuperview().inset(16)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(366)
            make.centerX.equalToSuperview()
        }
    }
}

extension MainPageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recentVisitBoardTableView {
            return 5
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recentVisitBoardTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentVisitBoardTableViewCell.identifier, for: indexPath) as? RecentVisitBoardTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(streamerName: "박앙우", subscriberCount: "0명")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LivePostRankingTableViewCell.identifier, for: indexPath) as? LivePostRankingTableViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            cell.configure(streamerName: "잭뤼 ·", postTitle: "인기글이구먼유", userName: "동준뤼")
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == recentVisitBoardTableView {
            return 44
        } else {
            return 74
        }
    }
}
