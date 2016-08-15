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

    func testSelectionVCScreenOne() {


        let app = XCUIApplication()

        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        let nextButton = XCUIApplication().navigationBars["My Items"].buttons["next"]
        XCTAssert(nextButton.exists)

        //Does CollectionView Exist
        let element = app.otherElements.containingType(.NavigationBar, identifier:"My Items").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        let collectionView = element.childrenMatchingType(.CollectionView).element
        XCTAssert(collectionView.exists)

        //Does collectionview image exist
        let image = app.collectionViews.cells.otherElements.childrenMatchingType(.Image).element
        XCTAssert(image.exists)

        //Scroll Collectionview?
        collectionView.tap()

        //Does Page Control exist?
        let pageControl = element.childrenMatchingType(.Other).elementBoundByIndex(1)
        XCTAssert(pageControl.exists)


        //Do Labels and ImageViews Exit

        let myCartLabel = app.staticTexts["My Cart"]
        let progressView = element.childrenMatchingType(.Other).elementBoundByIndex(1)
        let nameLabel = app.staticTexts["Dorothy Layered Hammered Cuff"]
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        let brandLabel = app.staticTexts["ZAD"]
        let costLabel = app.staticTexts["34.00"]

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameLabel.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        //Keep Button exist? Is user notified?
        let keepButton = app.buttons["Keep :)"]
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
       let alertView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()

        nextButton.tap()

    }



    func recordingTestExample() {


        
        let nextButton = myItemsNavigationBar.buttons["next"]
        nextButton.tap()
        image.tap()
        app.staticTexts["Black and Gold Dangle Necklace"].tap()
        app.staticTexts["Adia Kibur"].tap()
        app.staticTexts["50.00"].tap()
        keepButton.tap()
        okButton.tap()
        nextButton.tap()
        app.staticTexts["Henry Birds on Branch Infinity Scarf"].tap()
        app.staticTexts["Octavia"].tap()
        app.staticTexts["28.00"].tap()
        nextButton.tap()
        app.staticTexts["Corinna Striped Dolman Top"].tap()
        app.staticTexts["Market & Spruce"].tap()
        app.staticTexts["48.00"].tap()
        image.tap()
        image.tap()
        nextButton.tap()
        image.tap()
        image.tap()
        app.staticTexts["Anita Skinny Pant"].tap()
        app.staticTexts["Liverpool"].tap()
        app.staticTexts["78.00"].tap()
        collectionView.tap()
        collectionView.tap()
        collectionView.tap()
        collectionView.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        myItemsNavigationBar.buttons["done"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Dorothy Layered Hammered Cuff"].tap()
        tablesQuery.staticTexts["Black and Gold Dangle Necklace"].tap()

        /////
        
        let app = XCUIApplication()
        let myItemsNavigationBar = app.navigationBars["My Items"]
        let nextButton = myItemsNavigationBar.buttons["next"]
        nextButton.tap()
        nextButton.tap()
        app.buttons["Keep :)"].tap()
        app.alerts.collectionViews.buttons["OK"].tap()
        nextButton.tap()
        nextButton.tap()
        myItemsNavigationBar.buttons["done"].tap()
        

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
