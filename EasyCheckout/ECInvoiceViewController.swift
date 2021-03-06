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
    private var confirmButton: UIButton

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
        self.confirmButton = UIButton()

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

        view.backgroundColor = UIColor.whiteColor()

        //Nav Bar
        let navString = "Checkout"
        let navLabel = UILabel()
        navLabel.textColor = UIColor(netHex: 0x4A4A4A)
        navLabel.attributedText = returnNavTitleString(navString)
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        navLabel.textAlignment = NSTextAlignment.Center

        let doneButtonImage = UIImage(named: "done")!
        let dponeButton = UIButton(type: .Custom)
        dponeButton.frame = CGRectMake(0,0,40,19)
        dponeButton.setImage(doneButtonImage, forState: .Normal)

        lineView.backgroundColor = UIColor.blackColor()


        itemOverviewTableView.registerClass(ECInvoiceTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        itemOverviewTableView.dataSource = self
        itemOverviewTableView.delegate = self
        itemOverviewTableView.allowsSelection = false



        subtotalLabel.textAlignment = .Center
        subtotalLabel.font = UIFont(name: "Avenir-Book", size: 12)
        subtotalLabel.textColor = UIColor(netHex: 0x9B9B9B)
        subtotalLabel.text = "Subtotal"

        subtotalAmountLabel.textAlignment = .Center
        subtotalAmountLabel.font = UIFont(name: "Avenir-Book", size: 12)
        subtotalAmountLabel.textColor = UIColor(netHex: 0x9B9B9B)
        if let sub = invoice?.subtotal {
            if let unwrapped = returnConvertedDollarAmount(sub){
                subtotalAmountLabel.text = unwrapped
            }

        }

        taxLabel.textAlignment = .Center
        taxLabel.font = UIFont(name: "Avenir-Book", size: 12)
        taxLabel.textColor = UIColor.blackColor()
        taxLabel.text = "Tax"

        taxAmountLabel.textAlignment = .Center
        taxAmountLabel.font = UIFont(name: "Avenir-Book", size: 12)
        taxAmountLabel.textColor = UIColor.blackColor()
        if let tx = invoice?.tax {
            if let unwrapped = returnConvertedDollarAmount(tx){
                taxAmountLabel.text = unwrapped
            }

        }

        totalLabel.textAlignment = .Center
        totalLabel.font = UIFont(name: "Avenir-Book", size: 12)
        totalLabel.textColor = UIColor.blackColor()
        totalLabel.text = "Total"

        totalAmountLabel.textAlignment = .Center
        totalAmountLabel.font = UIFont(name: "Avenir-Book", size: 12)
        totalAmountLabel.textColor = UIColor.blackColor()
        totalAmountLabel.text = invoice?.total
        if let tl = invoice?.total {
            if let unwrapped = returnConvertedDollarAmount(tl){
                totalAmountLabel.text = unwrapped
            }

        }

        confirmButton.setTitle("Confirm", forState: .Normal)
        confirmButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 18)
        confirmButton.backgroundColor = UIColor(netHex: 0xF7B445)
        confirmButton.layer.borderWidth = 0.0
        confirmButton.titleLabel?.textColor = UIColor.whiteColor()

        confirmButton.layer.shadowColor = UIColor.blackColor().CGColor
        confirmButton.layer.shadowOffset = CGSizeMake(5, 5)
        confirmButton.layer.shadowRadius = 5
        confirmButton.layer.cornerRadius = 25
        confirmButton.layer.shadowOpacity = 0.3

        itemOverviewTableView.separatorColor = UIColor(netHex: 0xEDEDED)
        itemOverviewTableView.separatorInset = UIEdgeInsetsZero
        itemOverviewTableView.layoutMargins = UIEdgeInsetsZero
        itemOverviewTableView.rowHeight = 60

        self.navigationItem.hidesBackButton = true

        setConstraints()

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
        self.view.addSubview(confirmButton)


    }


    // MARK: UITableView

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let fix = items {
            return fix.count
        }else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdendifier, forIndexPath: indexPath) as! ECInvoiceTableViewCell

        if let fix = items {
            let item = fix[indexPath.row] as ECItem
            cell.photoImageUrl = item.imageUrl
            cell.productLabel.text = item.name
            cell.costLabel.text = item.price! + "0"
        }

        return cell
    }

    


    // MARK: AutoLayout

    func setConstraints() {
        let margins = view.layoutMarginsGuide


        itemOverviewTableView.translatesAutoresizingMaskIntoConstraints = false
        itemOverviewTableView.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 0).active = true
        itemOverviewTableView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 0).active = true
        itemOverviewTableView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 0).active = true
        itemOverviewTableView.heightAnchor.constraintEqualToAnchor(nil, constant: 360).active = true

        subtotalLabel.translatesAutoresizingMaskIntoConstraints = false
        subtotalLabel.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 5).active = true
        subtotalLabel.topAnchor.constraintEqualToAnchor(itemOverviewTableView.bottomAnchor, constant: 100).active = true

        subtotalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        subtotalAmountLabel.centerYAnchor.constraintEqualToAnchor(subtotalLabel.centerYAnchor).active = true
        subtotalAmountLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true

        taxLabel.translatesAutoresizingMaskIntoConstraints = false
        taxLabel.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant:5).active = true
        taxLabel.topAnchor.constraintEqualToAnchor(subtotalAmountLabel.bottomAnchor, constant: 10).active = true

        taxAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        taxAmountLabel.centerYAnchor.constraintEqualToAnchor(taxLabel.centerYAnchor).active = true
        taxAmountLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraintEqualToAnchor(taxAmountLabel.bottomAnchor, constant: 10).active = true
        lineView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 0).active = true
        lineView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: 0).active = true
        lineView.heightAnchor.constraintEqualToAnchor(nil, constant: 1).active = true

        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant:5).active = true
        totalLabel.topAnchor.constraintEqualToAnchor(lineView.bottomAnchor, constant: 10).active = true

        totalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalAmountLabel.centerYAnchor.constraintEqualToAnchor(totalLabel.centerYAnchor).active = true
        totalAmountLabel.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: 5).active = true

        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
        confirmButton.topAnchor.constraintEqualToAnchor(totalLabel.bottomAnchor, constant: 40).active = true
        confirmButton.widthAnchor.constraintEqualToAnchor(nil, constant: 200).active = true
        confirmButton.heightAnchor.constraintEqualToAnchor(nil, constant: 48).active = true
        confirmButton.enabled = false

    }





    //MARK: Helper Functions

    func returnNavTitleString(stringValue: String) -> NSAttributedString {
        let newString = NSAttributedString(string: stringValue, attributes: [NSKernAttributeName: CGFloat(3.0), NSFontAttributeName:UIFont (name: "Bangla MN", size: 16)!, NSForegroundColorAttributeName: UIColor.blackColor()])
        return newString
    }

    func returnConvertedDollarAmount(stringValue: String) -> String? {
        //conversion handles all situations
        if let convertedDouble = Double(stringValue) {
            return String(format: "%.02f", (convertedDouble / 1.0))
        }
        return nil
    }


}
