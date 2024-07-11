//
//  ViewController.swift
//  ziririt-iOS
//
//  Created by Porori on 7/2/24.
//

import UIKit
import SnapKit
import NaverThirdPartyLogin
import Alamofire

class ViewController: UIViewController {
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInstance?.delegate = self
        view.backgroundColor = .black
        setup()
        addButtonFunc()
        print("검색화면을 수진님께서 구현")
    }
    
    private let logoImageView : UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo_zziririt_big")
        imageView.image = image
        return imageView
    }()
    
    private let loginLabel : UILabel = {
        let label = UILabel()
        label.text = "로그인하고 찌리릿 서비스를\n자유롭게 사용해보세요."
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "btn_login")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let logoutButton : UIButton = {
        let button = UIButton()
        let image = UIImage(named: "btn_login")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    @objc func loginButtonTapped() {
        loginInstance?.requestThirdPartyLogin()
    }
    
    @objc func logoutButtonTapped() {
        loginInstance?.requestDeleteToken()
    }
    
    private func addButtonFunc() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    
    private func setup() {
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(logoutButton)
        view.addSubview(logoImageView)
        view.addSubview(loginLabel)
        view.addSubview(buttonStackView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(203)
            make.centerX.equalToSuperview()
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(61)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(61)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
    }
    
    func getInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else { return }
            guard let nickname = object["nickname"] as? String else { return }
//            guard let resultcode = object["resultcode"] as? String else { return }
//            guard let message = object["message"] as? String else { return }
//            guard let gender = object["gender"] as? String else { return }
//            guard let age = object["age"] as? String else { return }
//            guard let birthday = object["birthday"] as? String else { return }
//            guard let profile_image = object["profile_image"] as? String else { return }
//            guard let birthyear = object["birthyear"] as? String else { return }
//            guard let mobile = object["mobile"] as? String else { return }

            print("데이터 : \(object)")
            print("이름 : \(name)")
            print("이메일 : \(email)")
            print("id : \(id)")
            print("별명 : \(nickname)")
//            print("resultcode : \(resultcode)")
//            print("메세지 : \(message)")
//            print("성별 : \(gender)")
//            print("나이 : \(age)")
//            print("생일 : \(birthday)")
//            print("프로필 이미지 url : \(profile_image)")
//            print("출생연도 : \(birthyear)")
//            print("휴대전화 번호 : \(mobile)")
                        
            //self.nameLabel.text = "\(name)"
            //self.emailLabel.text = "\(email)"
            //self.idLabel.text = "\(id)"
        }
    }
}

// MARK: - NaverThirdPartyLoginConnectionDelegate
extension ViewController: NaverThirdPartyLoginConnectionDelegate {
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("로그인 성공!!")
        getInfo()
        
    }
    
    // refresh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("리프레시 토큰")
        getInfo()
    }
    
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("로그아웃")
        getInfo()
    }
    
    // 모든 에러 처리
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("---ERROR: \(error.localizedDescription)---")
    }
}
