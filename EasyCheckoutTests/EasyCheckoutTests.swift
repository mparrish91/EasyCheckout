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
        
        let expectation = self.expectationWithDescription("High Expectations")


        networkingHelper.fetchCurrentFix { (data, error) in
        

            XCTAssert(data.count > 0)
//            XCTAssert(data.count == -1)

            XCTAssert(data[0].brand == "Market & Spruce")
            
            expectation.fulfill()
            


        }
        
        self.waitForExpectationsWithTimeout(5.0, handler: { (error) in
            print("error \(error)")
        })
        
        
    }
    
    

    func testUpdateFix() {

        networkingHelper.updateCurrentFix(keptData, completionHandler: { (data, error) in
            XCTAssert(data.subtotal != nil)
            XCTAssert(data.tax != nil)
            XCTAssert(data.total != nil)
        })
    }



    //other thoughts
    //check to make sure dollar labels are correct format -- two zeros


    func testDecimals() {
        var number = "25"
        number = String(format: "%.02f", (Double(25) / 1.0))
        XCTAssert(number == "25.00")

        number = "25.0"
        number = String(format: "%.02f", (Double(25.0) / 1.0))
        XCTAssert(number == "25.00")

        number = "25.1"
        number = String(format: "%.02f", (Double(25.1) / 1.0))
        XCTAssert(number == "25.10")

        number = "25.10"
        number = String(format: "%.02f", (Double(25.10) / 1.0))
        XCTAssert(number == "25.10")


        number = "25.000"
        number = String(format: "%.02f", (Double(25.000) / 1.0))
        XCTAssert(number == "25.00")
    }
}






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



