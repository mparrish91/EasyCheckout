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
    private var photCollectionView: UICollectionView
    private var pageControl: TAPageControl
    //    private var progressView: ECProgressView
    private var cartLabel: UILabel

    private var productIconImageView: UIImageView
    private var brandIconImageView: UIImageView
    private var costIconImageView: UIImageView
    private var keepButton: UIButton    



    required convenience init?(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }

    init?(_ coder: NSCoder? = nil) {
        self.items = [ECItem]()


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
        self.photCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        self.photCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        loadCollectionView()
        
    }


    // MARK: UICollectionView

     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count ?? 0
    }

     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? UICollectionViewCell {

            let item = items[indexPath.row]

            if let image = item.image {
//                cell.forecastImageView.image = UIImage(named: image)


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


            photCollectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

            photCollectionView.frame = self.view.frame
            photCollectionView.backgroundColor = UIColor(netHex: 0xEEF4FB)
            photCollectionView.alwaysBounceVertical = true
            photCollectionView.bounces = true
            
            photCollectionView.scrollEnabled = true

        
    }

    // MARK: UIViewController


    override func viewDidLoad() {
        super.viewDidLoad()

        ECNetworkingHelper.sharedInstance.fetchCurrentFix { (data, error) in
            
        }

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        //PageControl
        self.pageControl.numberOfPages = items.count

    }




}
