//
//  MySneakersUITests2.swift
//  MySneakersUITests2
//
//  Created by Dorian Emenir on 16/03/2023.
//

import XCTest

final class ViewControllerUITests2: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    ///  Function tests the presence of the app's "MySneakers" title in the view
    func testTitleLabel() {
        app.launch()
        XCTAssertTrue(app.staticTexts["My Sneakers"].exists)
    }
    
    /// Function tests the value of the "name" textField object when an input is given
    func testNameTextField_WhenGivenName_FillsTextField() {
        app.launch()
        
        let nameTextField = app.textFields["Enter your name"]
        nameTextField.tap()
        nameTextField.typeText("John")
        
        XCTAssertTrue(app.textFields["John"].exists)
    }
}
