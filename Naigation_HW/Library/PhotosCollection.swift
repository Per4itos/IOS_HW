//
//  PhotosCollection.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 03.07.2023.
//

import UIKit

final class Photos {
    
    static let shared = Photos()
    
    let examples: [UIImage]
    
    private init() {
        var photos = [UIImage]()
        for i in 1...20 { photos.append((UIImage(named: "image\(i)") ?? UIImage())) }
        examples = photos.shuffled()
    }
}
