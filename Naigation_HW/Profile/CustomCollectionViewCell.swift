//
//  CustomCollectionViewCell.swift
//  Naigation_HW
//
//  Created by macOS on 21.10.2022.
//

import UIKit
import iOSIntPackage


class CustomCollectionViewCell: UICollectionViewCell {
    
    var photos = [UIImage]()
    
    let imageFacade = ImagePublisherFacade()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prhotoConfige(photo: UIImage) {
        self.imageView.image = photo
    }
    
    func setupCell(for imageName:String, or indexPath: IndexPath, arrayOfImages: [UIImage]) {
        let arrayOfFinishedImages: [UIImage] = PhotoCollectionFilter().createArrayOfImages(arrayOf: arrayOfImages)
        imageView.image = arrayOfFinishedImages[indexPath.row]
    }
    
    private func setupView() {
        self.contentView.addSubview(self.imageView)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}
