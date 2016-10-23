//
//  ECSelectionViewController.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit
//import TAPageControl


final class ECSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    fileprivate var item: ECItem
    fileprivate var photoCollectionView: UICollectionView
//    private var pageControl: TAPageControl
    fileprivate var progressView: ECProgressView
    fileprivate var cartLabel: UILabel

    fileprivate var productIconImageView: UIImageView
    fileprivate var brandIconImageView: UIImageView
    fileprivate var costIconImageView: UIImageView
    fileprivate var productLabel: UILabel
    fileprivate var brandLabel: UILabel
    fileprivate var costLabel: UILabel

    fileprivate var keepButton: UIButton



    required convenience init?(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }

    init?(_ coder: NSCoder? = nil) {
        self.item = ECItem()
        self.photoCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
//        self.pageControl = TAPageControl()
        self.progressView = ECProgressView()
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

        self.photoCollectionView.register(ECCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        loadCollectionView()

    }


    // MARK: UICollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ECCollectionViewCell {

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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width * 0.8
        let height = collectionView.bounds.height * 0.8
        let size = CGSize(width: width, height: height) 
        return size
    }


    func loadCollectionView() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
        photoCollectionView.frame = self.view.frame
        photoCollectionView.backgroundColor = UIColor.white
        photoCollectionView.showsVerticalScrollIndicator = false

    }



    // MARK: UIViewController
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        


        self.title = "My Items"
        view.backgroundColor = UIColor.white


        setConstraints()


        cartLabel.text = "My Cart"
        cartLabel.font = UIFont(name: "Avenir-Book", size: 12)
        cartLabel.textColor = UIColor(netHex: 0xF7B445)


//        pageControl.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
//        pageControl.currentDotImage = UIImage(named: "oval22Copy9")
//        pageControl.dotImage = UIImage(named: "oval22Copy8")

        keepButton.setTitle("Keep :)", for: UIControlState())
        keepButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 18)
        keepButton.backgroundColor = UIColor(netHex: 0xF7B445)
        keepButton.layer.borderWidth = 0.0
        keepButton.titleLabel?.textColor = UIColor.white

        keepButton.layer.shadowColor = UIColor.black.cgColor
        keepButton.layer.shadowOffset = CGSize(width: 0,height: 2)
        keepButton.layer.shadowRadius = 5
        keepButton.layer.cornerRadius = 25
        keepButton.layer.shadowOpacity = 0.3
        keepButton.addTarget(self, action: #selector(onKeepButtonPressed), for: .touchUpInside)


        //Nav Bar
        let navString = "My Items"
        let navLabel = UILabel()
        navLabel.textColor = UIColor(netHex: 0x4A4A4A)
        navLabel.attributedText = returnNavTitleString(navString)
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        navLabel.textAlignment = NSTextAlignment.center

        let nextButtonImage = UIImage(named: "next")!
        let nextButton = UIButton(type: .custom)
        nextButton.frame = CGRect(x: 0,y: 0,width: 40,height: 19)
        nextButton.setImage(nextButtonImage, for: UIControlState())
        nextButton.addTarget(self, action: #selector(ECSelectionViewController.onNextButtonPressed), for: UIControlEvents.touchUpInside)
        let nextButtonItem = UIBarButtonItem(customView: nextButton)
        self.navigationItem.setRightBarButton(nextButtonItem, animated: false)
        self.navigationItem.hidesBackButton = true


        //enable progress view once Data has loaded
        NotificationCenter.default.addObserver(self, selector: #selector(ECSelectionViewController.enableProgressView), name: NSNotification.Name(rawValue: "dataLoaded"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //increment progress count (users is moving through cart)
        print(navigationController!.viewControllers.count - 1)
        self.progressView.setColoredUpToIndex((navigationController!.viewControllers.count - 1))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        self.pageControl.numberOfPages = 4


        //Changing bar button to Done to notify user
        let nav = self.navigationController as! ECNavigationController

        let index = nav.nextVCIndex
        if index == nav.vcArray.count {
            let nextButtonImage = UIImage(named: "done")!
            let nextButton = UIButton(type: .custom)
            nextButton.frame = CGRect(x: 0,y: 0,width: 40,height: 19)
            nextButton.setImage(nextButtonImage, for: UIControlState())
            nextButton.addTarget(self, action: #selector(ECSelectionViewController.onNextButtonPressed), for: UIControlEvents.touchUpInside)

            let nextButtonItem = UIBarButtonItem(customView: nextButton)

            self.navigationItem.setRightBarButton(nextButtonItem, animated: false)
        }

    }

    override func loadView() {
        self.view = UIView()
        self.view.addSubview(photoCollectionView)
//        self.view.addSubview(pageControl)
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
        if let id = item.id {
            ECNetworkingHelper.sharedInstance.keptItemIDs.append(id)
            ECNetworkingHelper.sharedInstance.keptItemsArray.append(item)

        }
        let alertController = UIAlertController(title: "", message: "Item added to cart :)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)

    }



    func onNextButtonPressed() {

        let nav = self.navigationController as! ECNavigationController
        let index = nav.nextVCIndex
        let keptItems = ECNetworkingHelper.sharedInstance.keptItemIDs
        let items = ECNetworkingHelper.sharedInstance.keptItemsArray
        if index == nav.vcArray.count {
            //fetch invoice
            //present invoice VC

            ECNetworkingHelper.sharedInstance.updateCurrentFix(keptItems, completionHandler: { (data, error) in
                DispatchQueue.main.async(execute: {
                    if let invoiceVC = ECInvoiceViewController(items: items , invoice: data) {
                        self.navigationController?.pushViewController(invoiceVC, animated: true)
                    }
                })
            })
        }else {

            //push next selection
            let nextVC = nav.vcArray[index]
            self.navigationController?.pushViewController(nextVC, animated: true)
            nav.nextVCIndex += 1

        }
        
     
    }


    func enableProgressView() {
        
        let count = ECNetworkingHelper.sharedInstance.itemCount
        self.progressView.count = count
        self.progressView.createShapeLayer(count)




    }

    // MARK: AutoLayout

    func setConstraints() {
        let margins = view.layoutMarginsGuide

        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        photoCollectionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        photoCollectionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        photoCollectionView.bottomAnchor.constraint(equalTo: cartLabel.topAnchor, constant: -10).isActive = true
        photoCollectionView.contentMode = .scaleAspectFit

//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.trailingAnchor.constraintEqualToAnchor(photoCollectionView.trailingAnchor, constant:-5).active = true
//        pageControl.bottomAnchor.constraintEqualToAnchor(photoCollectionView.bottomAnchor, constant: -20).active = true

        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -5).isActive = true
        cartLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true

//        center the progress view and constrain everything from it
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        progressView.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 80).isActive = true
        progressView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        // FIXME: Why is this negative, its working for now
        progressView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true

        productIconImageView.translatesAutoresizingMaskIntoConstraints = false
        productIconImageView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20).isActive = true
        productIconImageView.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 0).isActive = true
        productIconImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        productIconImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        productIconImageView.contentMode = .scaleAspectFit
        productIconImageView.image = UIImage(named: "nameIcon")

        brandIconImageView.translatesAutoresizingMaskIntoConstraints = false
        brandIconImageView.topAnchor.constraint(equalTo: productIconImageView.bottomAnchor, constant: 5).isActive = true
        brandIconImageView.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 0).isActive = true
        brandIconImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        brandIconImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        brandIconImageView.contentMode = .scaleAspectFit
        brandIconImageView.image = UIImage(named: "brandIcon")

        costIconImageView.translatesAutoresizingMaskIntoConstraints = false
        costIconImageView.topAnchor.constraint(equalTo: brandIconImageView.bottomAnchor, constant: 5).isActive = true
        costIconImageView.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 0).isActive = true
        costIconImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        costIconImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        costIconImageView.contentMode = .scaleAspectFit
        costIconImageView.image = UIImage(named: "costIcon")

        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.centerYAnchor.constraint(equalTo: productIconImageView.centerYAnchor).isActive = true
        productLabel.leadingAnchor.constraint(equalTo: productIconImageView.trailingAnchor, constant: 5).isActive = true
        productLabel.textAlignment = .left
        productLabel.numberOfLines = 2
        productLabel.font = UIFont(name: "Avenir-Book", size: 18)
        productLabel.textColor = UIColor(netHex: 0x9B9B9B)

        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.centerYAnchor.constraint(equalTo: brandIconImageView.centerYAnchor).isActive = true
        brandLabel.leadingAnchor.constraint(equalTo: brandIconImageView.trailingAnchor, constant: 5).isActive = true
        brandLabel.textAlignment = .left
        brandLabel.numberOfLines = 1
        brandLabel.font = UIFont(name: "Avenir-Book", size: 18)
        brandLabel.textColor = UIColor(netHex: 0x9B9B9B)

        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.centerYAnchor.constraint(equalTo: costIconImageView.centerYAnchor).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: costIconImageView.trailingAnchor, constant: 5).isActive = true
        costLabel.textAlignment = .left
        costLabel.numberOfLines = 1
        costLabel.font = UIFont(name: "Avenir-Book", size: 18)
        costLabel.textColor = UIColor(netHex: 0x9B9B9B)

        keepButton.translatesAutoresizingMaskIntoConstraints = false
        keepButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        keepButton.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 40).isActive = true
        keepButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        keepButton.heightAnchor.constraint(equalToConstant: 48).isActive = true

    }



    func returnNavTitleString(_ stringValue: String) -> NSAttributedString {
        let newString = NSAttributedString(string: stringValue, attributes: [NSKernAttributeName: CGFloat(3.0), NSFontAttributeName:UIFont (name: "Bangla MN", size: 16)!, NSForegroundColorAttributeName: UIColor.black])
        return newString
    }

    
    
}
