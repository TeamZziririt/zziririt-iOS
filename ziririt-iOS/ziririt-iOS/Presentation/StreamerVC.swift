//
//  Streamer.swift
//  ziririt-iOS
//
//  Created by Porori on 7/25/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class StreamerVC: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Components
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        return scroll
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.addArrangedSubview(boardHeader)
        stack.addArrangedSubview(noticeBoard)
        stack.addArrangedSubview(communityBoard)
        return stack
    }()
    
    private let boardHeader: UIButton = {
        let button = UIButton()
        button.setTitle("스트리머 게시판 검색", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let noticeBoard: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 10
        tableView.clipsToBounds = true
        tableView.register(NoticeBoardTableViewCell.self,
                           forCellReuseIdentifier: NoticeBoardTableViewCell.identifier)
        return tableView
    }()
    
    private let communityBoard: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        tableView.layer.cornerRadius = 10
        tableView.clipsToBounds = true
        tableView.backgroundColor = .darkGray
        tableView.register(NoticeBoardTableViewCell.self,
                           forCellReuseIdentifier: NoticeBoardTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    
    init(boardTitle: String) {
        boardHeader.setTitle(boardTitle, for: .normal)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        bind()
    }
    
    // MARK: - Methods
    
    private func bind() {
        boardHeader.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                print("버튼이 눌렸습니다.")
            }
            .disposed(by: disposeBag)
        
        noticeBoard.rx.itemSelected
            .withUnretained(self)
            .subscribe { (owner, indexPath) in
                print("공지사항 \(indexPath.row)번째가 눌렸습니다.")
            }
            .disposed(by: disposeBag)
        
        communityBoard.rx.itemSelected
            .withUnretained(self)
            .subscribe { (owner, indexPath) in
                print("게시판 \(indexPath.row)번째가 눌렸습니다.")
            }
            .disposed(by: disposeBag)
    }
    
    private func setup() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(contentStack)
        
        noticeBoard.delegate = self
        noticeBoard.dataSource = self
        
        communityBoard.delegate = self
        communityBoard.dataSource = self
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(scrollView.snp.size)
        }
        
        contentStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
         
        noticeBoard.snp.makeConstraints { make in
            make.height.equalTo(97)
        }
        
        communityBoard.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom)
        }
    }
}

extension StreamerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == noticeBoard ? 3 : 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeBoardTableViewCell.identifier, for: indexPath) as! NoticeBoardTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView == noticeBoard ? self.noticeBoard.frame.height/3 : CGFloat(50)
    }
}
