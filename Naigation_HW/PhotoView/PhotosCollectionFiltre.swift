//
//  PhotosCollectionFiltre.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 07.07.2023.
//

//import UIKit
//import iOSIntPackage
//
//final class PhotoCollectionFilter: NSObject {
//    
//    private let imageProcessor = ImageProcessor()
//    var finalImagesArray: [UIImage] = []
//    
//    func createArrayOfImages(arrayOf: [UIImage]) -> [UIImage] {
//        for i in 0...Photos.shared.photo.endIndex {
//            var finishedImage = UIImage()
//            
//            imageProcessor.processImage(sourceImage: (arrayOf[i]), filter: .fade) { finishedImage = $0 ?? UIImage(named: "image\(i)" )! }
//            finalImagesArray.append(finishedImage)
//        }
//        return finalImagesArray
//    }
//}
