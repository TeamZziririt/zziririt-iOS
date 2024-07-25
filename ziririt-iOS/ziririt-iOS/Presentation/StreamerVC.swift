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
        stack.addArrangedSubview(boardHeader)
        stack.addArrangedSubview(boardRank)
        return stack
    }()
    
    private let boardHeader: UIButton = {
        let button = UIButton()
        button.setTitle("스트리머 게시판 검색", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let boardRank: UITableView = {
        let tableView = UITableView()
        tableView.register(BoardTableViewHeader.self,
                           forHeaderFooterViewReuseIdentifier: BoardTableViewHeader.identifier)
        return tableView
    }()
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    
    init(board: String) {
        boardHeader.titleLabel?.text = board
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
    }
    
    private func setup() {
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .black
        boardRank.backgroundColor = .clear
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(contentStack)
        
        boardRank.delegate = self
        boardRank.dataSource = self
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
            make.leading.trailing.equalToSuperview().inset(16)
        }
         
        boardRank.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom)
        }
    }
}

extension StreamerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: BoardTableViewHeader.identifier) as? BoardTableViewHeader
        header?.setTitle(title: "스트리머 게시판 랭킹")
        return header
    }
}
