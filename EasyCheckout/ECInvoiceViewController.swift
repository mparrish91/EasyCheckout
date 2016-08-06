//
//  ECInvoiceViewController.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit


final class ECInvoiceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var items: [ECItem]
    private var photoCollectionView: UICollectionView
    private var pageControl: TAPageControl
    private var progressView: ECProgressView
    private var cartLabel: UILabel

    private var productIconImageView: UIImageView
    private var brandIconImageView: UIImageView
    private var costIconImageView: UIImageView
    private var productLabel: UILabel
    private var brandLabel: UILabel
    private var costLabel: UILabel

    private var keepButton: UIButton



    required convenience init?(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }

    init?(_ coder: NSCoder? = nil) {
        self.items = [ECItem]()

        self.photoCollectionView = UICollectionView()
        self.pageControl = TAPageControl()
        self.progressView = ECProgressView()
        self.cartLabel = UILabel()
        self.productIconImageView = UIImageView()
        self.brandIconImageView = UIImageView()
        self.costIconImageView = UIImageView()
        self.productLabel = UILabel()
        self.brandLabel = UILabel()
        self.costLabel = UILabel()
        self.keepButton = UIButton()

        self.title = "My Items" 


        if let coder = coder {
            super.init(coder: coder)
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
    }

    convenience init?(items: [ECItem]) {
        self.init()
        self.items = items
        self.photoCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        self.photoCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        loadCollectionView()
        
    }


    // MARK: UICollectionView

     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count ?? 0
    }

     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? ECCollectionViewCell {

            let item = items[indexPath.row]

            productLabel.text = item.name
            brandLabel.text = item.brand
            costLabel.text = item.price


            if let image = item.image {
                cell.photoImageView.image = UIImage(named: image)


            }

            return cell
        }else {
            let cell = UICollectionViewCell()
            return cell
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size = collectionView.bounds.size
        return size
    }


    func loadCollectionView() {

            photoCollectionView.delegate = self

            photoCollectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

            photoCollectionView.frame = self.view.frame
            photoCollectionView.backgroundColor = UIColor(netHex: 0xEEF4FB)
            photoCollectionView.alwaysBounceVertical = true
            photoCollectionView.bounces = true
            
            photoCollectionView.scrollEnabled = true

        
    }

    // MARK: UIViewController


    override func viewDidLoad() {
        super.viewDidLoad()

        cartLabel.text = "My Cart"
        cartLabel.font = UIFont(name: "Avenir-Book", size: 12)
        cartLabel.textColor = UIColor(netHex: 0xF7B445)


        self.pageControl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        self.pageControl.currentDotImage = UIImage(named: "oval22Copy9")
        self.pageControl.dotImage = UIImage(named: "oval22Copy8")


        keepButton.setTitle("Keep :)", forState: .Normal)
        keepButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 18)
        keepButton.backgroundColor = UIColor(netHex: 0xF7B445)
        keepButton.layer.borderWidth = 0.0
        keepButton.titleLabel?.textColor = UIColor.whiteColor()

        keepButton.layer.shadowColor = UIColor.blackColor().CGColor
        keepButton.layer.shadowOffset = CGSizeMake(5, 5)
        keepButton.layer.shadowRadius = 5
        keepButton.layer.cornerRadius = 25


        keepButton.addTarget(self, action: #selector(onKeepButtonPressed), forControlEvents: .TouchUpInside)


        productLabel.font = UIFont(name: "Avenir-Book", size: 18)
        productLabel.textColor = UIColor(netHex: 0x9B9B9B)
        brandLabel.font = UIFont(name: "Avenir-Book", size: 18)
        brandLabel.textColor = UIColor(netHex: 0x9B9B9B)
        costLabel.font = UIFont(name: "Avenir-Book", size: 18)
        costLabel.textColor = UIColor(netHex: 0x9B9B9B)




        ECNetworkingHelper.sharedInstance.fetchCurrentFix { (data, error) in
            
        }

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        //PageControl
        self.pageControl.numberOfPages = items.count

    }


    // MARK: AutoLayout

    func setConstraints() {
        let margins = contentView.layoutMarginsGuid


        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 0).active = true
        photoCollectionView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 0).active = true
        photoCollectionView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 0).active = true
        photoCollectionView.bottomAnchor.constraintEqualToAnchor(cartLabel.topAnchor, constant: 10).active = true
        photoCollectionView.contentMode = .ScaleAspectFit
        photoCollectionView.image = UIImage(named: "background")

        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.bottomAnchor.constraintEqualToAnchor(progressView.topAnchor, constant: 5).active = true
        cartLabel.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 10).active = true

        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor).active = true
        progressView.centerYAnchor.constraintEqualToAnchor(contentView.centerYAnchor, constant: 50).active = true
        progressView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 10).active = true



        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor).active = true
        descriptionLabel.topAnchor.constraintEqualToAnchor(factImageView.bottomAnchor, constant: 30).active = true
        descriptionLabel.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 30).active = true
        descriptionLabel.font = UIFont(name: "Helvetica Neue", size: 30)
        descriptionLabel.textAlignment = .Center
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.numberOfLines = 3
        descriptionLabel.text = "Swipe Right to Like \nor\n Swipe Left to Dislike"




    }








}
