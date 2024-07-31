//
//  CommonPostsVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 8/1/24.
//

import UIKit

class CommonMypageBoardVC: UIViewController {
    
    // MARK: - Components
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewTitle
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CommonMypageBoardTableViewCell.self, forCellReuseIdentifier: CommonMypageBoardTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tableView
    }()
    
    private let viewTitle: String
    
    // MARK: - Initializer
    
    init(title: String) {
        self.viewTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupUI()
    }
    
    // MARK: - Methods
    
    private func setView() {
        view.backgroundColor = .blackBackgroundColor
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
            view.addSubview(backButton)
            view.addSubview(titleLabel)
            view.addSubview(tableView)
            
            backButton.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.leading.equalToSuperview().offset(16)
                make.size.equalTo(24)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.centerY.equalTo(backButton)
                make.centerX.equalToSuperview()
            }
            
            tableView.snp.makeConstraints { make in
                make.top.equalTo(backButton.snp.bottom).offset(16)
                make.leading.trailing.bottom.equalToSuperview()
            }
        }
}

extension CommonMypageBoardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommonMypageBoardTableViewCell.identifier, for: indexPath) as? CommonMypageBoardTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(title: "글 제목", userName: "유저 닉네임", createdAt: "글 작성 시간", commentCount: "댓글 개수", thumbnailImage: UIImage(named: "thumbnail_placeholder")!)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

