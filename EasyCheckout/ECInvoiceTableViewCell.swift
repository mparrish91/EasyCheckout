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
            if let url = URL(string: photoImageUrl!){
                if let data = try? Data(contentsOf: url) {
                    self.photoImageView.image = UIImage(named: "placeholder")
                    self.photoImageView.downloadImageFrom(link: photoImageUrl!, contentMode: UIViewContentMode.scaleAspectFit)

                }
            }

        }
    }

    var productLabel: UILabel
    var costIconImageView: UIImageView
    var costLabel: UILabel
    override var layoutMargins: UIEdgeInsets {
        get { return UIEdgeInsets.zero }
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
        photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        photoImageView.contentMode = .scaleAspectFit


        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        productLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 20).isActive = true
        productLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true

        productLabel.textAlignment = .left
        productLabel.numberOfLines = 2
        productLabel.font = UIFont(name: "Avenir-Book", size: 12)
        productLabel.textColor = UIColor.black   

        costIconImageView.translatesAutoresizingMaskIntoConstraints = false
        costIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        costIconImageView.trailingAnchor.constraint(equalTo: costLabel.leadingAnchor, constant: -3).isActive = true
        costIconImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        costIconImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        costIconImageView.contentMode = .scaleAspectFit
        costIconImageView.image = UIImage(named: "costIcon")

        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        costLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 1).isActive = true
        costLabel.textAlignment = .center
        costLabel.font = UIFont(name: "Avenir-Book", size: 12)
        costLabel.textColor = UIColor(netHex: 0x9B9B9B)

    }



    

    
    
    
}

