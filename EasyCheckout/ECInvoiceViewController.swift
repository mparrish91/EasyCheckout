//
//  ECSelectionViewController.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit


final class ECInvoiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var items: [ECItem]?
    private var invoice: ECInvoice?

    private var itemOverviewTableView: UITableView
    private var subtotalLabel: UILabel
    private var subtotalAmountLabel: UILabel
    private var taxLabel: UILabel
    private var taxAmountLabel: UILabel
    private var lineView: UIView
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
        self.lineView = UIView()
        self.totalLabel = UILabel()
        self.totalAmountLabel = UILabel()

        if let coder = coder {
            super.init(coder: coder)
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
    }

    convenience init?(items: [ECItem], invoice: ECInvoice ) {
        self.init()
        self.items = items
        self.invoice = invoice

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

        let doneButtonImage = UIImage(named: "done")!
        let dponeButton = UIButton(type: .Custom)
        dponeButton.frame = CGRectMake(0,0,40,19)
        dponeButton.setImage(doneButtonImage, forState: .Normal)

        lineView.backgroundColor = UIColor.blackColor()


        tableView.registerClass(MyCustomCell.self, forCellReuseIdentifier: cellReuseIdendifier)

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func loadView() {
        self.view = UIView()
        self.view.addSubview(itemOverviewTableView)
        self.view.addSubview(subtotalLabel)
        self.view.addSubview(subtotalAmountLabel)
        self.view.addSubview(taxLabel)
        self.view.addSubview(taxAmountLabel)
        self.view.addSubview(lineView)
        self.view.addSubview(totalLabel)
        self.view.addSubview(totalAmountLabel)

    }


    // MARK: UITableView

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdendifier, forIndexPath: indexPath) as! ECInvoiceTableViewCell
        cell.photoImageUrl = items[indexPath.row].imageUrl
        cell.productLabel.text = items[indexPath.row].name
        cell.costLabel.text = items[indexPath.row].price



        return cell
    }

    
    

    
    
    
}
