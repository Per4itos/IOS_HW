//
//  FeedModel.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 10.07.2023.
//

import Foundation

protocol FeedViewModelProtocol {
    func check(word: String) -> Bool
    var stateChanged: ((FeedViewModel.State) -> Void)? { get set }

}

final class FeedViewModel: FeedViewModelProtocol {
    
    enum State {
        case initial
        case loading
        case loaded(FeedModelStruct)
        case error
    }
    
    var stateChanged: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            stateChanged?(state)
        }
    }

    var feedModel: FeedModel
    
    init(feedModel: FeedModel) {
        self.feedModel = feedModel
    }
    
    func changeState() {
        state = .loading
        feedModel.fetch { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let feedWord):
                print(feedWord)
                self.state = .loaded(feedWord)
                
            case .failure:
                self.state = .error
            }
        }
    }

    func check(word: String) -> Bool {
//        word = feedModel.feedWord ? true : false
        return true
    }
}
