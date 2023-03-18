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
    
    // MARK: testTitleLabel()
    
    ///  Function tests the presence of the app's "MySneakers" title in the view
    func testTitleLabel() {
        app.launch()
        XCTAssertTrue(app.staticTexts["My Sneakers"].exists)
    }
    
    // MARK: testNameTextField_WhenGivenName_FillsTextField()
    
    /// Function tests the value of the "name" textField object when an input is given
    func testNameTextField_WhenGivenName_FillsTextField() {
        app.launch()
        
        let nameTextField = app.textFields["Enter your name"]
        nameTextField.tap()
        nameTextField.typeText("John")
        
        XCTAssertTrue(app.textFields["John"].exists)
    }
    
    // MARK: testSegmentedControl_WhenTapped_ChangeSegment()
    
    /// Function tests the value of the "type" segmentedControl object when it is tapped
    func testSegmentedControl_WhenTapped_ChangeSegment() {
        app.launch()
        
        
    }
    
    // MARK: testGenderSwitch_WhenTapped_ChangeSwitchValue()
    
    /// Function tests the value of the "gender" switch object when it is tapped
    func testGenderSwitch_WhenTapped_ChangeSwitchValue() {
        app.launch()
        
        
    }
    
    // MARK: testSizeStepper_WhenTapped_ChangeSizeValue()
    
    /// Function tests the value of the "size" stepper object when it is tapped
    func testSizeStepper_WhenTapped_ChangeSizeValue() {
        app.launch()
        
    }
    
    // MARK: testColorPicker_WhenScrolled_ChangeColor()
    
    /// Function tests the value of the "name" textField object when an input is given
    func testColorPicker_WhenScrolled_ChangeColor() {
        app.launch()
        
    }
}
