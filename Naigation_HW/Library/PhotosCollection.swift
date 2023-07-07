//
//  PhotosCollection.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 03.07.2023.
//

import UIKit
import iOSIntPackage

final class Photos {
    
    static let shared = Photos()
    
    let photo: [UIImage]
    
    private init() {
        var photos = [UIImage]()
        for i in 0...19 { photos.append((UIImage(named: "image\(i)") ?? UIImage())) }
        photo = photos
    }
}

