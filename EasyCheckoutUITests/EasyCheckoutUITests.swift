//
//  EasyCheckoutUITests.swift
//  EasyCheckoutUITests
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import XCTest

class EasyCheckoutUITests: XCTestCase {


    let app = XCUIApplication()



    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        sleep(1)


        let button = app.buttons["Keep :)"]
        XCTAssert(button.exists)



        sleep(1)

//        //verify title
//        XCTAssert(app.navigationBars["My Items"].exists)
//
////        sleep(1)
////
//
//        XCTAssert(app.staticTexts["My Cart"].exists)
        XCTAssert(app.buttons["Keep :)"].exists)

//        app.buttons["Keep :)"].tap()
//
//        //push keep button
//        app.alerts[""].buttons["Keep :)"].tap()
//
//        //assert the item has text and image have changed
//        XCTAssert(app.navigationBars["Volleyball?"].exists)
//
//
//
//
//
//        //verify title
//        XCTAssert(app.navigationBars["Checkout"].exists)
//
//        XCTAssert(app.staticTexts["Subtotal"].exists)
//        XCTAssert(app.staticTexts["Tax"].exists)
//        XCTAssert(app.staticTexts["Total"].exists)
//        XCTAssert(app.staticTexts["Confirm"].exists)
//


    }
    
}
