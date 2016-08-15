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
        
        continueAfterFailure = false

        // Before each specific test


    }

    func testSelectionVCScreenOne() {

        app.launch()

        //Wait for app to download data
        sleep(1)

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
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        let nameLabel = app.staticTexts["Dorothy Layered Hammered Cuff"]
        let brandLabel = app.staticTexts["ZAD"]
        let costLabel = app.staticTexts["34.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        let keepButton = app.buttons["Keep :)"]
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
       let alertView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()

        //Load next itemVC
        nextButton.tap()

    }


    func testSelectionVCScreenTwo() {

        app.launch()

        //Wait for app to download data
        sleep(1)

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
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        let nameLabel = app.staticTexts["Black and Gold Dangle Necklace"]
        let brandLabel = app.staticTexts["Adia Kibur"]
        let costLabel = app.staticTexts["50.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        let keepButton = app.buttons["Keep :)"]
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        let alertView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()

    }

    func testSelectionVCScreenThree() {

        app.launch()

        //Wait for app to download data
        sleep(1)

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
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        let nameLabel = app.staticTexts["Henry Birds on Branch Infinity Scarf"]
        let brandLabel = app.staticTexts["Octavia"]
        let costLabel = app.staticTexts["28.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        let keepButton = app.buttons["Keep :)"]
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        let alertView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()
        
    }

    func testSelectionVCScreenFour() {

        app.launch()

        //Wait for app to download data
        sleep(1)

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
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        let nameLabel = app.staticTexts["Corinna Striped Dolman Top"]
        let brandLabel = app.staticTexts["Market & Spruce"]
        let costLabel = app.staticTexts["48.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        let keepButton = app.buttons["Keep :)"]
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        let alertView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()
        
    }

    func testSelectionVCScreenFive() {

        app.launch()

        //Wait for app to download data
        sleep(1)

        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        let doneButton = XCUIApplication().navigationBars["My Items"].buttons["done"]
        XCTAssert(doneButton.exists)

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
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        let nameLabel = app.staticTexts["Anita Skinny Pant"]
        let brandLabel = app.staticTexts["Liverpool"]
        let costLabel = app.staticTexts["78.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        let keepButton = app.buttons["Keep :)"]
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        let alertView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()
        
        //Load next itemVC
        doneButton.tap()

    }



    func testInvoiceVC() {

        //Does Nav Bar exist
        let navTitle = app.navigationBars["Checkout"].staticTexts["Checkout"]
        XCTAssert(navTitle.exists)

        //Does Table exist
        let tablesQuery = app.tables
        let firstCell = tablesQuery.staticTexts["Dorothy Layered Hammered Cuff"]
        let second = tablesQuery.staticTexts["Black and Gold Dangle Necklace"]
        let third = tablesQuery.staticTexts["Henry Birds on Branch Infinity Scarf"]
        let fourth = tablesQuery.staticTexts["Corinna Striped Dolman Top"]
        let fifth = tablesQuery.staticTexts["Anita Skinny Pant"]

        XCTAssert(firstCell.exists)
        XCTAssert(second.exists)
        XCTAssert(third.exists)
        XCTAssert(fourth.exists)
        XCTAssert(fifth .exists)



        //Do Labels and values exist
        app.staticTexts["Subtotal"].tap()
        app.staticTexts["Tax"].tap()
        app.staticTexts["Total"].tap()
        app.staticTexts["238.00"].tap()
        app.staticTexts["23.00"].tap()
        app.staticTexts["261.00"].tap()
        
        let line = app.otherElements.containingType(.NavigationBar, identifier:"Checkout").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        XCTAssert(line.exists)

        //Does confirm button exist
        let confirm = app.buttons["Confirm"]
        XCTAssert(confirm.exists)



    }


    

    
}
