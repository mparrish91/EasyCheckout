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


    func testEasyCheckout() {

        //Mark: Screen 1

        app.launch()

        //Wait for app to download data
        sleep(1)

        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        var nextButton = XCUIApplication().navigationBars["My Items"].buttons["next"]
        XCTAssert(nextButton.exists)

        //Does CollectionView Exist
        let element = app.otherElements.containing(.navigationBar, identifier:"My Items").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let collectionView = element.children(matching: .collectionView).element
        XCTAssert(collectionView.exists)

        //Does collectionview image exist
        let image = app.collectionViews.cells.otherElements.children(matching: .image).element
        XCTAssert(image.exists)

        //Scroll Collectionview?
        collectionView.tap()

        //Does Page Control exist?
        let pageControl = element.children(matching: .other).element(boundBy: 1)
        XCTAssert(pageControl.exists)


        //Do Labels and ImageViews Exit

        let myCartLabel = app.staticTexts["My Cart"]
        let progressView = element.children(matching: .other).element(boundBy: 1)
        let nameIcon = app.images["nameIcon"]
        let brandIcon = app.images["brandIcon"]
        let costIcon = app.images["costIcon"]
        var nameLabel = app.staticTexts["Dorothy Layered Hammered Cuff"]
        var brandLabel = app.staticTexts["ZAD"]
        var costLabel = app.staticTexts["34.00"]

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
        let alertView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .alert).element
        XCTAssert(alertView.exists)

        let okButton = app.alerts.collectionViews.buttons["OK"]
        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()


        //Mark: Screen 2

        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        XCTAssert(nextButton.exists)

        //Does CollectionView Exist
        XCTAssert(collectionView.exists)

        //Does collectionview image exist
        XCTAssert(image.exists)

        //Scroll Collectionview?
        collectionView.tap()

        //Does Page Control exist?
        XCTAssert(pageControl.exists)


        //Do Labels and ImageViews Exit

        nameLabel = app.staticTexts["Black and Gold Dangle Necklace"]
        brandLabel = app.staticTexts["Adia Kibur"]
        costLabel = app.staticTexts["50.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        XCTAssert(alertView.exists)

        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()


        //Mark: Screen 3

        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        XCTAssert(nextButton.exists)

        //Does CollectionView Exist
        XCTAssert(collectionView.exists)

        //Does collectionview image exist
        XCTAssert(image.exists)

        //Scroll Collectionview?
        collectionView.tap()

        //Does Page Control exist?
        XCTAssert(pageControl.exists)


        //Do Labels and ImageViews Exit

        nameLabel = app.staticTexts["Henry Birds on Branch Infinity Scarf"]
        brandLabel = app.staticTexts["Octavia"]
        costLabel = app.staticTexts["28.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        XCTAssert(alertView.exists)
        
        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()


        //Mark: Screen 4


        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        XCTAssert(nextButton.exists)

        //Does CollectionView Exist
        XCTAssert(collectionView.exists)

        //Does collectionview image exist
        XCTAssert(image.exists)

        //Scroll Collectionview?
        collectionView.tap()

        //Does Page Control exist?
        XCTAssert(pageControl.exists)


        //Do Labels and ImageViews Exit

        nameLabel = app.staticTexts["Corinna Striped Dolman Top"]
        brandLabel = app.staticTexts["Market & Spruce"]
        costLabel = app.staticTexts["48.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        XCTAssert(alertView.exists)

        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()


        //Mark: Screen 5


        //Does Nav Bar exist
        XCTAssert(app.navigationBars["My Items"].exists)

        //Does Next Button exist
        nextButton = XCUIApplication().navigationBars["My Items"].buttons["done"]
        XCTAssert(nextButton.exists)

        //Does CollectionView Exist
        XCTAssert(collectionView.exists)

        //Does collectionview image exist
        XCTAssert(image.exists)

        //Scroll Collectionview?
        collectionView.tap()

        //Does Page Control exist?
        XCTAssert(pageControl.exists)


        //Do Labels and ImageViews Exit

        nameLabel = app.staticTexts["Anita Skinny Pant"]
        brandLabel = app.staticTexts["Liverpool"]
        costLabel = app.staticTexts["78.00"]

        XCTAssert(nameLabel.exists)
        XCTAssert(brandLabel.exists)
        XCTAssert(costLabel.exists)

        XCTAssert(myCartLabel.exists)
        XCTAssert(progressView.exists)
        XCTAssert(nameIcon.exists)
        XCTAssert(brandIcon.exists)
        XCTAssert(costIcon.exists)

        //Keep Button exist? Is user notified?
        XCTAssert(keepButton.exists)
        keepButton.tap()

        //Alert View??
        XCTAssert(alertView.exists)
        
        okButton.tap()
        
        //Load next itemVC
        nextButton.tap()



        //Mark: Invoice VC

        //Wait for app to download data
        sleep(5)


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

        //How many cells?
        let cells = XCUIApplication().tables.cells
        XCTAssertEqual(cells.count, 5, "found instead: \(cells.debugDescription)")

        sleep(1)


        //Tablecell

        app.tables.staticTexts["34.00"].tap()
        app.tables.staticTexts["50.00"].tap()
        app.tables.staticTexts["28.00"].tap()
        app.tables.staticTexts["48.00"].tap()
        app.tables.staticTexts["78.00"].tap()


        //Do Total and other Lower Labels and values exist?
        let subLabel = app.staticTexts["Subtotal"]
        let taxLabel = app.staticTexts["Tax"]
        let totalLabel = app.staticTexts["Total"]
        let subAmount =  app.staticTexts["238.00"]
        let taxAmount =  app.staticTexts["23.00"]
        let totalAmount = app.staticTexts["261.00"]

        XCTAssert(subLabel.exists)
        XCTAssert(taxLabel.exists)
        XCTAssert(totalLabel.exists)
        XCTAssert(subAmount.exists)
        XCTAssert(taxAmount.exists)
        XCTAssert(totalAmount.exists)


        let line = app.otherElements.containing(.navigationBar, identifier:"Checkout").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        XCTAssert(line.exists)

        //Does confirm button exist
        let confirm = app.buttons["Confirm"]
        XCTAssert(confirm.exists)

    }

    
}
