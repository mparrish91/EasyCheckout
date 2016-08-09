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
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = contentView.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraintEqualToAnchor(contentView.topAnchor, constant: 0).active = true
        photoImageView.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: 0).active = true
        photoImageView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: 0).active = true
        photoImageView.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, constant: 0).active = true
        photoImageView.contentMode = .ScaleAspectFit


        costIconImageView.translatesAutoresizingMaskIntoConstraints = false
        costIconImageView.topAnchor.constraintEqualToAnchor(brandIconImageView.bottomAnchor, constant: 5).active = true
        costIconImageView.leadingAnchor.constraintEqualToAnchor(progressView.leadingAnchor, constant: 0).active = true
        costIconImageView.widthAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        costIconImageView.heightAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        costIconImageView.contentMode = .ScaleAspectFit
        costIconImageView.image = UIImage(named: "costIcon")

        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.centerYAnchor.constraintEqualToAnchor(costIconImageView.centerYAnchor).active = true
        costLabel.leadingAnchor.constraintEqualToAnchor(costIconImageView.leadingAnchor, constant: 5).active = true
        costLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true
        costLabel.textAlignment = .Center
        costLabel.numberOfLines = 1
        costLabel.font = UIFont(name: "Avenir-Book", size: 18)
        costLabel.textColor = UIColor(netHex: 0x9B9B9B)






    }
    

    
    
    
}

