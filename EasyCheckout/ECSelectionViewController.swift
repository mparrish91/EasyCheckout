//
//  ECSelectionViewController.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit
import TAPageControl


final class ECSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var item: ECItem
    private var photoCollectionView: UICollectionView
    private var pageControl: TAPageControl
    private var progressView: UIView
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
        self.item = ECItem()
        self.photoCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        self.pageControl = TAPageControl()
        self.progressView = UIView()
        self.cartLabel = UILabel()
        self.productIconImageView = UIImageView()
        self.brandIconImageView = UIImageView()
        self.costIconImageView = UIImageView()
        self.productLabel = UILabel()
        self.brandLabel = UILabel()
        self.costLabel = UILabel()
        self.keepButton = UIButton()



        if let coder = coder {
            super.init(coder: coder)
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
    }

    convenience init?(item: ECItem) {
        self.init()
        self.item = item
//        self.progressView.count = items.count
//        self.progressView.createShapeLayer(items.count)
        self.photoCollectionView.registerClass(ECCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        loadCollectionView()

    }


    // MARK: UICollectionView

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? ECCollectionViewCell {

            productLabel.text = item.name
            brandLabel.text = item.brand
            costLabel.text = item.price! + "0"
            cell.photoImageUrl = item.imageUrl


            return cell
        }else {
            let cell = UICollectionViewCell()
            return cell
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = collectionView.bounds.size
        return size
    }


    func loadCollectionView() {

        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self


        photoCollectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        photoCollectionView.frame = self.view.frame
        photoCollectionView.backgroundColor = .whiteColor()
        photoCollectionView.alwaysBounceVertical = true
        photoCollectionView.bounces = true

        photoCollectionView.scrollEnabled = true


    }

    // MARK: UIViewController


    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Items"
        view.backgroundColor = UIColor.whiteColor()

        progressView.backgroundColor = .yellowColor()

        self.setConstraints()


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
        keepButton.layer.shadowOpacity = 0.3



        keepButton.addTarget(self, action: #selector(onKeepButtonPressed), forControlEvents: .TouchUpInside)


        //Nav Bar
        let navString = "My Items"
        let navLabel = UILabel()
        navLabel.textColor = UIColor(netHex: 0x4A4A4A)
        navLabel.attributedText = returnNavTitleString(navString)
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        navLabel.textAlignment = NSTextAlignment.Center

        let nextButtonImage = UIImage(named: "next")!
        let nextButton = UIButton(type: .Custom)
        nextButton.frame = CGRectMake(0,0,40,19)
        nextButton.setImage(nextButtonImage, forState: .Normal)
        nextButton.addTarget(self, action: "onNextButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)

        let nextButtonItem = UIBarButtonItem(customView: nextButton)

        self.navigationItem.setRightBarButtonItem(nextButtonItem, animated: false)






    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        //        PageControl
        self.pageControl.numberOfPages = 4

    }

    override func loadView() {
        self.view = UIView()
        self.view.addSubview(photoCollectionView)
        self.view.addSubview(pageControl)
        self.view.addSubview(progressView)
        self.view.addSubview(cartLabel)
        self.view.addSubview(productIconImageView)
        self.view.addSubview(brandIconImageView)
        self.view.addSubview(costIconImageView)
        self.view.addSubview(productLabel)
        self.view.addSubview(brandLabel)
        self.view.addSubview(costLabel)
        self.view.addSubview(keepButton)
    }



    func onKeepButtonPressed() {

    }



    func onNextButtonPressed() {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let index = appDelegate.nextVCIndex
        let nextVC = appDelegate.vcArray[index]
        self.navigationController?.pushViewController(nextVC, animated: true)
        appDelegate.nextVCIndex += 1


    }


    // MARK: AutoLayout

    func setConstraints() {
        let margins = view.layoutMarginsGuide


        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 0).active = true
        photoCollectionView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 0).active = true
        photoCollectionView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 0).active = true
        photoCollectionView.bottomAnchor.constraintEqualToAnchor(cartLabel.topAnchor, constant: -5).active = true
        photoCollectionView.contentMode = .ScaleAspectFit

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.trailingAnchor.constraintEqualToAnchor(photoCollectionView.trailingAnchor, constant:-5).active = true
        pageControl.bottomAnchor.constraintEqualToAnchor(photoCollectionView.bottomAnchor, constant: -20).active = true

        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.bottomAnchor.constraintEqualToAnchor(progressView.topAnchor, constant: -5).active = true
        cartLabel.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 10).active = true


//        center the progress view and constrain everything from it
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
        progressView.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor, constant: 50).active = true
        progressView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 10).active = true
        progressView.heightAnchor.constraintEqualToAnchor(nil, constant: 6).active = true


        // FIXME: Why is this negative, its working for now
        progressView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -10).active = true


        productIconImageView.translatesAutoresizingMaskIntoConstraints = false
        productIconImageView.topAnchor.constraintEqualToAnchor(progressView.bottomAnchor, constant: 20).active = true
        productIconImageView.leadingAnchor.constraintEqualToAnchor(progressView.leadingAnchor, constant: 0).active = true
        productIconImageView.widthAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        productIconImageView.heightAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        productIconImageView.contentMode = .ScaleAspectFit
        productIconImageView.image = UIImage(named: "nameIcon")

        brandIconImageView.translatesAutoresizingMaskIntoConstraints = false
        brandIconImageView.topAnchor.constraintEqualToAnchor(productIconImageView.bottomAnchor, constant: 5).active = true
        brandIconImageView.leadingAnchor.constraintEqualToAnchor(progressView.leadingAnchor, constant: 0).active = true
        brandIconImageView.widthAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        brandIconImageView.heightAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        brandIconImageView.contentMode = .ScaleAspectFit
        brandIconImageView.image = UIImage(named: "brandIcon")

        costIconImageView.translatesAutoresizingMaskIntoConstraints = false
        costIconImageView.topAnchor.constraintEqualToAnchor(brandIconImageView.bottomAnchor, constant: 5).active = true
        costIconImageView.leadingAnchor.constraintEqualToAnchor(progressView.leadingAnchor, constant: 0).active = true
        costIconImageView.widthAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        costIconImageView.heightAnchor.constraintEqualToAnchor(nil, constant: 35).active = true
        costIconImageView.contentMode = .ScaleAspectFit
        costIconImageView.image = UIImage(named: "costIcon")

        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.centerYAnchor.constraintEqualToAnchor(productIconImageView.centerYAnchor).active = true
        productLabel.leadingAnchor.constraintEqualToAnchor(productIconImageView.leadingAnchor, constant: 5).active = true
        productLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true
        productLabel.textAlignment = .Center
        productLabel.numberOfLines = 2
        productLabel.font = UIFont(name: "Avenir-Book", size: 18)
        productLabel.textColor = UIColor(netHex: 0x9B9B9B)

        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.centerYAnchor.constraintEqualToAnchor(brandIconImageView.centerYAnchor).active = true
        brandLabel.leadingAnchor.constraintEqualToAnchor(brandIconImageView.leadingAnchor, constant: 5).active = true
        brandLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true
        brandLabel.textAlignment = .Center
        brandLabel.numberOfLines = 1
        brandLabel.font = UIFont(name: "Avenir-Book", size: 18)
        brandLabel.textColor = UIColor(netHex: 0x9B9B9B)


        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.centerYAnchor.constraintEqualToAnchor(costIconImageView.centerYAnchor).active = true
        costLabel.leadingAnchor.constraintEqualToAnchor(costIconImageView.leadingAnchor, constant: 5).active = true
        costLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true
        costLabel.textAlignment = .Center
        costLabel.numberOfLines = 1
        costLabel.font = UIFont(name: "Avenir-Book", size: 18)
        costLabel.textColor = UIColor(netHex: 0x9B9B9B)

        

        keepButton.translatesAutoresizingMaskIntoConstraints = false
        keepButton.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
        keepButton.topAnchor.constraintEqualToAnchor(costLabel.bottomAnchor, constant: 40).active = true
        keepButton.widthAnchor.constraintEqualToAnchor(nil, constant: 200).active = true
        keepButton.heightAnchor.constraintEqualToAnchor(nil, constant: 48).active = true



    }


    func returnNavTitleString(stringValue: String) -> NSAttributedString {
        let newString = NSAttributedString(string: stringValue, attributes: [NSKernAttributeName: CGFloat(3.0), NSFontAttributeName:UIFont (name: "Bangla MN", size: 16)!, NSForegroundColorAttributeName: UIColor.blackColor()])
        return newString
    }

    
    
    
    
    
    
}
