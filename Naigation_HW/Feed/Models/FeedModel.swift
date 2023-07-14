//
//  FeedModel.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 14.07.2023.
//

import Foundation

struct FeedModelStruct {
    
    var word: String
    
}

   class FeedModel {
    
    var feedWord = FeedModelStruct(word: "1")

    func fetch(completion: @escaping (Result<FeedModelStruct, Error>) -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            sleep(3)
            completion(.success(self.feedWord))
        }
    }
    
}

