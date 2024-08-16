//
//  DetailContentVM.swift
//  ziririt-iOS
//
//  Created by Porori on 8/13/24.
//

import Foundation
import RxCocoa
import RxSwift

final class DetailContentVM {
    struct Input {
        let returnToRoot: ControlEvent<Void>
        let profileActionTapped: ControlEvent<Void>
        let profileSecondaryTapped: ControlEvent<Void>
        let actionButtonTapped: ControlEvent<Void>
    }
    
    struct Output {
        let returnToRoot: ControlEvent<Void>
        let bookmarkTapped: ControlEvent<Void>
        let editTapped: ControlEvent<Void>
        let likeButtonTapped: ControlEvent<Void>
        
        let title: Observable<String>
        let userName: Observable<String>
        let dateValue: Observable<String>
        let content: Observable<String>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        let title = "치치직&아프리카 마피아 추리류 야생 스트리머 마크 서버 인원 모집중 길고 길게 길고 길게길고 길게 길고 길게"
        let user = "유저 닉네임"
        let date = "2024.08.16"
        let content = "테스트테스트테스트테스트테스트테스트테스트"
        
        return Output(
            returnToRoot: input.returnToRoot,
            bookmarkTapped: input.profileActionTapped,
            editTapped: input.profileSecondaryTapped,
            likeButtonTapped: input.actionButtonTapped,
            
            title: Observable.just(title),
            userName: Observable.just(user),
            dateValue: Observable.just(date),
            content: Observable.just(content)
        )
    }
}
