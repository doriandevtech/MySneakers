//
//  MySneakersUITests2.swift
//  MySneakersUITests2
//
//  Created by Dorian Emenir on 16/03/2023.
//

import XCTest

final class MySneakersUITests2: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTitleLabel() {
        app.launch()
        XCTAssertTrue(app.staticTexts["My Sneakers"].exists)
    }
}
