//
//  StreamerSearchVC.swift
//  ziririt-iOS
//
//  Created by 박상우 on 7/30/24.
//

import UIKit

class StreamerSearchVC: UIViewController {
    // MARK: - Components
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "스트리머 게시판 검색"
        label.font = UIFont(name: "GmarketSansTTFBold", size: 24)
        label.textColor = .white
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .clear
        searchBar.backgroundImage = UIImage()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
               textField.backgroundColor = .darkGray
               textField.textColor = .white
               textField.tintColor = .white
           }
        searchBar.searchTextField.leftView?.tintColor = .white
        return searchBar
    }()
    
    private lazy var searchResultLabel: UILabel = {
        let label = UILabel()
        label.text = "스트리머 게시판 검색 결과"
        label.font = UIFont(name: "GmarketSansTTFBold", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var searchResultTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(StreamerSearchResultTableViewCell.self, forCellReuseIdentifier: StreamerSearchResultTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var applyBoardButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "스트리머 게시판 신청하기"
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "GmarketSansTTFBold", size: 16)
            return outgoing
        }
        configuration.image = UIImage(named: "pencil_icon")?.withRenderingMode(.alwaysTemplate)
        configuration.imagePadding = 8
        configuration.imagePlacement = .leading
        configuration.baseForegroundColor = .black
        configuration.background.backgroundColor = .green
        configuration.background.cornerRadius = 8

        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.tintColor = .black

        return button
    }()

    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupUI()
    }
    // MARK: - Methods
    
    private func setView() {
        view.backgroundColor = .black
    }
    
    private func setupUI() {
        view.addSubview(headerLabel)
        view.addSubview(searchBar)
        view.addSubview(searchResultLabel)
        view.addSubview(searchResultTableView)
        view.addSubview(applyBoardButton)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(59)
            make.leading.equalToSuperview().offset(8)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(24)
            make.width.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        searchResultLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(24)
            make.leading.equalTo(headerLabel.snp.leading)
        }
        
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(searchResultLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        applyBoardButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(64)
            make.height.equalTo(36)
        }
    }
    
}

extension StreamerSearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StreamerSearchResultTableViewCell.identifier, for: indexPath) as? StreamerSearchResultTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(number: indexPath.row + 1, name: "박상우")
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
