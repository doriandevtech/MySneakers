//
//  ViewControllerTests.swift
//  MySneakersTests
//
//  Created by Dorian Emenir on 07/03/2023.
//

import XCTest
@testable import MySneakers

class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testInit_AreValuesInitiallyNotNil() {
        XCTAssertNotNil(sut.name, "Name should not be nil.")
        XCTAssertNotNil(sut.typeNumber, "\(sut.typeNumber) should not be nil.")
    }
    
    func testTitleLabel_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.titleLbl.text, "\(String(describing: sut.titleLbl.text)) should not be nil")
        XCTAssertEqual(sut.titleLbl.text, "My Sneakers")
    }
    
    func testSizeLabel_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.sizeLbl.text, "\(String(describing: sut.sizeLbl.text)) should not be nil")
        XCTAssertEqual(sut.sizeLbl.text, "40", "\(String(describing: sut.sizeLbl.text)) should equal to \"40\" at app launch")
    }
    
    func testGenderLabel_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.genderLbl.text, "\(String(describing: sut.genderLbl.text)) should not be nil")
        XCTAssertEqual(sut.genderLbl.text, "Boy", "\(String(describing: sut.genderLbl.text)) should equal \"Boy\" at app launch")
    }
    
    func testShoeTypeValue_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.type, "type should not be nil")
        XCTAssertEqual(sut.type, "City", "\(sut.type) should equal \"City\" at app launch")
    }

    func testColorPickerValue_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.color, "color should not be nil")
        XCTAssertEqual(sut.color, "White", "\(sut.color) should equal \"White\" at app launch")
    }
        
    func testShoeImage_ShouldNotBeNil() {
        XCTAssertNotNil(sut.shoeSelection.image, "\(String(describing: sut.shoeSelection.image)) should not be nil")
    }
    
    func testOrderResult_ShouldBeEmptyAtLaunch() {
        XCTAssertEqual(sut.orderResult.text, "", "\(String(describing: sut.orderResult.text)) should be equal to \"\" at app launch")
    }
    
    func testGenderButton_ShouldUpdateValueWhenPressed() {
        sut.genderSwitch.isOn = true
        sut.genderSwitch.sendActions(for: .valueChanged)
        XCTAssertEqual(sut.genderSwitch.isOn, false, "\(sut.genderSwitch.isOn) should be equal to false")
    }
}
