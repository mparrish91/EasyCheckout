//
//  ECInvoiceTableViewCell.swift
//  EasyCheckout
//
//  Created by parry on 8/8/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit

final class ECInvoiceTableViewCell: UITableViewCell {

    var photoImageView: UIImageView
    var photoImageUrl: String? {
        didSet{
            if let url = NSURL(string: photoImageUrl!){
                if let data = NSData(contentsOfURL: url) {
                    self.photoImageView.image = UIImage(named: "placeholder")
                    self.photoImageView.downloadImageFrom(link: photoImageUrl!, contentMode: UIViewContentMode.ScaleAspectFit)

                }
            }

        }
    }

    var productLabel: UILabel
    var costIconImageView: UIImageView
    var costLabel: UILabel
    override var layoutMargins: UIEdgeInsets {
        get { return UIEdgeInsetsZero }
        set(newVal) {}
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        self.photoImageView = UIImageView()
        self.productLabel = UILabel()
        self.costIconImageView = UIImageView()
        self.costLabel = UILabel()

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(photoImageView)
        contentView.addSubview(productLabel)
        contentView.addSubview(costIconImageView)
        contentView.addSubview(costLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = contentView.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor).active = true
        photoImageView.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: 5).active = true
        photoImageView.widthAnchor.constraintEqualToAnchor(nil, constant: 34).active = true
        photoImageView.heightAnchor.constraintEqualToAnchor(nil, constant: 52).active = true
        photoImageView.contentMode = .ScaleAspectFit


        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor).active = true
        productLabel.leadingAnchor.constraintEqualToAnchor(photoImageView.trailingAnchor, constant: 20).active = true
        productLabel.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, constant: 5).active = true

        productLabel.textAlignment = .Left
        productLabel.numberOfLines = 2
        productLabel.font = UIFont(name: "Avenir-Book", size: 12)
        productLabel.textColor = UIColor.blackColor()   

        costIconImageView.translatesAutoresizingMaskIntoConstraints = false
        costIconImageView.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor).active = true
        costIconImageView.trailingAnchor.constraintEqualToAnchor(costLabel.leadingAnchor, constant: -3).active = true
        costIconImageView.widthAnchor.constraintEqualToAnchor(nil, constant: 16).active = true
        costIconImageView.heightAnchor.constraintEqualToAnchor(nil, constant: 16).active = true
        costIconImageView.contentMode = .ScaleAspectFit
        costIconImageView.image = UIImage(named: "costIcon")

        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor).active = true
        costLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 1).active = true
        costLabel.textAlignment = .Center
        costLabel.font = UIFont(name: "Avenir-Book", size: 12)
        costLabel.textColor = UIColor(netHex: 0x9B9B9B)

    }



    

    
    
    
}

