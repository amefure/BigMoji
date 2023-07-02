//
//  BigMojiUITests.swift
//  BigMojiUITests
//
//  Created by t&a on 2023/06/27.
//

import XCTest

final class BigMojiUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlaneTextShow() throws {
        /// シンプルに文字のみを表示するTest
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        
        let textView = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("Hello")
        app.toolbars["Toolbar"].buttons["閉じる"].tap()
        collectionViewsQuery.containing(.other, identifier:"垂直スクロールバー, 2ページ").element.swipeUp()
        collectionViewsQuery.buttons["SHOW"].tap()
        XCUIApplication().navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["戻る"].tap()
        XCTAssertTrue(collectionViewsQuery.buttons["SHOW"].exists)
    }
    
    func testCustomTextShow() throws {
        /// 文字に装飾を施して表示するTest
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        
        let textView = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("Hello")
        app.toolbars["Toolbar"].buttons["閉じる"].tap()
        
        // 赤文字
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).scrollViews.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .button).element(boundBy: 0).tap()
        // 緑背景
        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).scrollViews.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .button).element(boundBy: 2).tap()
        
        collectionViewsQuery.buttons["bold"].tap()
        collectionViewsQuery.buttons["スペース"].tap()
        collectionViewsQuery.containing(.other, identifier:"垂直スクロールバー, 2ページ").element.swipeUp()
        collectionViewsQuery.buttons["SHOW"].tap()
        
        XCUIApplication().navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["戻る"].tap()
        XCTAssertTrue(collectionViewsQuery.buttons["SHOW"].exists)
    }
    
    func testSelectColorTextShow() throws {
        /// 文字に装飾を施して表示するTest
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        
        let textView = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("Hello")
        app.toolbars["Toolbar"].buttons["閉じる"].tap()
        
        
        let button = collectionViewsQuery.children(matching: .cell).element(boundBy: 3).scrollViews.otherElements.otherElements["色の選択"].children(matching: .other).element.children(matching: .button).element
        button.tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.otherElements["暗いシアン 35"].tap()
        elementsQuery.buttons["閉じる"].tap()
                
        collectionViewsQuery.containing(.other, identifier:"垂直スクロールバー, 2ページ").element.swipeUp()
        collectionViewsQuery.buttons["SHOW"].tap()
        
        XCUIApplication().navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["戻る"].tap()
        XCTAssertTrue(collectionViewsQuery.buttons["SHOW"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
