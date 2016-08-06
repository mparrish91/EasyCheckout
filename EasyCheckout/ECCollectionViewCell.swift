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

    override init(frame: CGRect) {

        self.photoImageView = UIImageView()


        let margins = contentView.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraintEqualToAnchor(contentView.topAnchor, constant: 0).active = true
        photoImageView.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: 0).active = true
        photoImageView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: 0).active = true
        photoImageView.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, constant: 0).active = true
        photoImageView.contentMode = .ScaleAspectFit


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
