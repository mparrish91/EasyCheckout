//
//  ECSelectionViewController.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit


final class ECInvoiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var itemOverviewTableView: UITableView
    private var subtotalLabel: UILabel
    private var subtotalAmountLabel: UILabel
    private var taxLabel: UILabel
    private var taxAmountLabel: UILabel
    private var totalLabel: UILabel
    private var totalAmountLabel: UILabel

    private let cellReuseIdendifier = "cell"




    required convenience init?(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }

    init?(_ coder: NSCoder? = nil) {

        self.itemOverviewTableView = UITableView()
        self.subtotalLabel = UILabel()
        self.subtotalAmountLabel = UILabel()
        self.taxLabel = UILabel()
        self.taxAmountLabel = UILabel()
        self.totalLabel = UILabel()
        self.totalAmountLabel = UILabel()

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




    override func viewDidLoad() {
        super.viewDidLoad()

        //Nav Bar
        let navString = "Checkout"
        let navLabel = UILabel()
        navLabel.backgroundColor = UIColor(netHex: 0x4A4A4A)
        navLabel.attributedText = returnNavTitleString(navString)
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        navLabel.textAlignment = NSTextAlignment.Center

        let nextButtonImage = UIImage(named: "done")!
        let nextButton = UIButton(type: .Custom)
        nextButton.frame = CGRectMake(0,0,40,19)
        nextButton.setImage(nextButtonImage, forState: .Normal)
        nextButton.addTarget(self, action: "onNextButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)


        tableView.registerClass(MyCustomCell.self, forCellReuseIdentifier: cellReuseIdendifier)

        tableView.dataSource = self
        tableView.delegate = self
    }


    // MARK: UITableView

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdendifier, forIndexPath: indexPath) as! ECInvoiceTableViewCell
        cell.myLabel.text = myArray[indexPath.row]
        
        return cell
    }
}
    
    
    
    
    
    
}
