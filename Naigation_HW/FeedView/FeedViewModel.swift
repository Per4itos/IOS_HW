//
//  FeedModel.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 10.07.2023.
//

import UIKit

final class FeedViewModel {
    
    var feedModel: FeedModel
    
    init(feedModel: FeedModel) {
        self.feedModel = feedModel
    }
    
    func check(word: String) -> Bool {
        word == feedModel.secretWord ? true : false
    }
}
