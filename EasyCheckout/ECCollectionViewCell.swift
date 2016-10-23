//
//  ECCollectionViewCell.swift
//  EasyCheckout
//
//  Created by parry on 8/6/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit

final class ECCollectionViewCell: UICollectionViewCell {

    var photoImageView: UIImageView
    var photoImageUrl: String? {
        didSet{
            if let url = URL(string: photoImageUrl!){
                self.photoImageView.image = UIImage(named: "placeholder")
                self.photoImageView.downloadImageFrom(link: photoImageUrl!, contentMode: UIViewContentMode.scaleAspectFit)
            }

        }
    }

    override init(frame: CGRect) {

        self.photoImageView = UIImageView()

          super.init(frame: frame)

        contentView.addSubview(photoImageView)



        let margins = contentView.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        photoImageView.contentMode = .scaleAspectFit


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
