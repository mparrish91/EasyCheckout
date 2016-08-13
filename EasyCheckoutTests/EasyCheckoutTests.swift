//
//  EasyCheckoutTests.swift
//  EasyCheckoutTests
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//


import XCTest
@testable import EasyCheckout

class EasyCheckoutTests: XCTestCase {


    var selectionVC: ECSelectionViewController!
    var invoiceVC: ECInvoiceViewController!
    var item: ECItem!
    var invoice: ECInvoice!
    var networkingHelper: ECNetworkingHelper!
    let keptData = ["28008527", "28008526", "28008525"]


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let itemData = [
            "id": 28008524,
            "name": "Corinna Striped Dolman Top",
            "price": "48.0",
            "brand": "Market & Spruce",
            "image_url": "http://www.stylemethrifty.com/wp-content/uploads/2015/01/stitch-fix-dolman-striped-top-smt.jpg"]
        let invoiceData = [
            "total": 123.2,
            "subtotal": 112,
            "tax": 11.2
        ]

        selectionVC = ECSelectionViewController()!
        invoiceVC = ECInvoiceViewController()!
        item = ECItem(dictionary: itemData)
        invoice = ECInvoice(dictionary: invoiceData)
        networkingHelper = ECNetworkingHelper.sharedInstance


    }


    //Mark: Networking (lower priority)

    func testFetchFix() {

        networkingHelper.fetchCurrentFix { (data, error) in

            XCTAssert(data == [ECItem])
        }

    }

    func testUpdateFix() {

        networkingHelper.updateCurrentFix(keptData, completionHandler: { (data, error) in
            XCTAssert(data == [ECInvoice])
        }
    }



    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

    //other thoughts

    //check to make sure dollar labels are correct format -- two zeros


    //Mark: User needs a fix

    //testFetch function   (networking library)



    //Mark: User needs to be able to modify a fix

    // - do view elements exist
    // - do they perform the proper actions

    // - can I test what the view elements show?

    //https://github.com/joemasilotti/UI-Testing-Cheat-Sheet




    //Mark: User needs to be able to view invoice

    // Is it the proper invoice data?  (test networking put)

    // - do view elements exist








}
