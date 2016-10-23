//
//  ECSelectionViewController.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit


final class ECInvoiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate var items: [ECItem]?
    fileprivate var invoice: ECInvoice?

    fileprivate var itemOverviewTableView: UITableView
    fileprivate var subtotalLabel: UILabel
    fileprivate var subtotalAmountLabel: UILabel
    fileprivate var taxLabel: UILabel
    fileprivate var taxAmountLabel: UILabel
    fileprivate var lineView: UIView
    fileprivate var totalLabel: UILabel
    fileprivate var confirmButton: UIButton

    fileprivate var totalAmountLabel: UILabel
    fileprivate let cellReuseIdendifier = "cell"

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

        view.backgroundColor = UIColor.white

        //Nav Bar
        let navString = "Checkout"
        let navLabel = UILabel()
        navLabel.textColor = UIColor(netHex: 0x4A4A4A)
        navLabel.attributedText = returnNavTitleString(navString)
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        navLabel.textAlignment = NSTextAlignment.center

        let doneButtonImage = UIImage(named: "done")!
        let dponeButton = UIButton(type: .custom)
        dponeButton.frame = CGRect(x: 0,y: 0,width: 40,height: 19)
        dponeButton.setImage(doneButtonImage, for: UIControlState())

        lineView.backgroundColor = UIColor.black


        itemOverviewTableView.register(ECInvoiceTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        itemOverviewTableView.dataSource = self
        itemOverviewTableView.delegate = self
        itemOverviewTableView.allowsSelection = false



        subtotalLabel.textAlignment = .center
        subtotalLabel.font = UIFont(name: "Avenir-Book", size: 12)
        subtotalLabel.textColor = UIColor(netHex: 0x9B9B9B)
        subtotalLabel.text = "Subtotal"

        subtotalAmountLabel.textAlignment = .center
        subtotalAmountLabel.font = UIFont(name: "Avenir-Book", size: 12)
        subtotalAmountLabel.textColor = UIColor(netHex: 0x9B9B9B)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
         if let sub = invoice?.subtotal {
            subtotalAmountLabel.text = formatter.string(from: NSNumber(value: sub))

            

        }
        

        taxLabel.textAlignment = .center
        taxLabel.font = UIFont(name: "Avenir-Book", size: 12)
        taxLabel.textColor = UIColor.black
        taxLabel.text = "Tax"

        taxAmountLabel.textAlignment = .center
        taxAmountLabel.font = UIFont(name: "Avenir-Book", size: 12)
        taxAmountLabel.textColor = UIColor.black
        if let tx = invoice?.tax {
            taxAmountLabel.text = formatter.string(from: NSNumber(value: tx))
        }

        totalLabel.textAlignment = .center
        totalLabel.font = UIFont(name: "Avenir-Book", size: 12)
        totalLabel.textColor = UIColor.black
        totalLabel.text = "Total"

        totalAmountLabel.textAlignment = .center
        totalAmountLabel.font = UIFont(name: "Avenir-Book", size: 12)
        totalAmountLabel.textColor = UIColor.black
        if let tl = invoice?.total {
            totalAmountLabel.text = formatter.string(from: NSNumber(value: tl))
        }
       

        confirmButton.setTitle("Confirm", for: UIControlState())
        confirmButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 18)
        confirmButton.backgroundColor = UIColor(netHex: 0xF7B445)
        confirmButton.layer.borderWidth = 0.0
        confirmButton.titleLabel?.textColor = UIColor.white

        confirmButton.layer.shadowColor = UIColor.black.cgColor
        confirmButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        confirmButton.layer.shadowRadius = 5
        confirmButton.layer.cornerRadius = 25
        confirmButton.layer.shadowOpacity = 0.3

        itemOverviewTableView.separatorColor = UIColor(netHex: 0xEDEDED)
        itemOverviewTableView.separatorInset = UIEdgeInsets.zero
        itemOverviewTableView.layoutMargins = UIEdgeInsets.zero
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let fix = items {
            return fix.count
        }else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! ECInvoiceTableViewCell

        if let fix = items {
            let item = fix[(indexPath as NSIndexPath).row] as ECItem
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
        itemOverviewTableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        itemOverviewTableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        itemOverviewTableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        itemOverviewTableView.heightAnchor.constraint(equalToConstant: 360).isActive = true

        subtotalLabel.translatesAutoresizingMaskIntoConstraints = false
        subtotalLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
        subtotalLabel.topAnchor.constraint(equalTo: itemOverviewTableView.bottomAnchor, constant: 100).isActive = true

        subtotalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        subtotalAmountLabel.centerYAnchor.constraint(equalTo: subtotalLabel.centerYAnchor).isActive = true
        subtotalAmountLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 5).isActive = true

        taxLabel.translatesAutoresizingMaskIntoConstraints = false
        taxLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant:5).isActive = true
        taxLabel.topAnchor.constraint(equalTo: subtotalAmountLabel.bottomAnchor, constant: 10).isActive = true

        taxAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        taxAmountLabel.centerYAnchor.constraint(equalTo: taxLabel.centerYAnchor).isActive = true
        taxAmountLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 5).isActive = true

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: taxAmountLabel.bottomAnchor, constant: 10).isActive = true
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant:5).isActive = true
        totalLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true

        totalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalAmountLabel.centerYAnchor.constraint(equalTo: totalLabel.centerYAnchor).isActive = true
        totalAmountLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 5).isActive = true

        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 40).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        confirmButton.isEnabled = false

    }





    //MARK: Helper Functions

    func returnNavTitleString(_ stringValue: String) -> NSAttributedString {
        let newString = NSAttributedString(string: stringValue, attributes: [NSKernAttributeName: CGFloat(3.0), NSFontAttributeName:UIFont (name: "Bangla MN", size: 16)!, NSForegroundColorAttributeName: UIColor.black])
        return newString
    }

    func returnConvertedDollarAmount(_ stringValue: String) -> String? {
        //conversion handles all situations
        if let convertedDouble = Double(stringValue) {
            return String(format: "%.02f", (convertedDouble / 1.0))
        }
        return nil
    }


}
