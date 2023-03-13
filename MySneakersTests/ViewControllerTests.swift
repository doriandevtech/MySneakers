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
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit_AreValuesInitiallyNotNil() {
        XCTAssertNotNil(sut.name, "Name should not be nil.")
        XCTAssertNotNil(sut.typeNumber, "TypeNumber should not be nil.")
    }
    
    func testGenderButton_ShouldUpdateLabelWhenIsOff() {
        _ = sut.genderSwitch.isOn
        sut.genderSwitch.sendActions(for: .valueChanged)
        XCTAssertEqual(sut.genderLbl.text, "Boy")
    }
    
    func testSizeLabel_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.sizeLbl.text, "sizeLbl should not be nil")
        XCTAssertEqual(sut.sizeLbl.text, "40", "sizeLbl should equal 40 at app'a launch")
    }
    
    func testGenderLabel_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.genderLbl.text, "genderLbl should not be nil")
        XCTAssertEqual(sut.genderLbl.text, "Boy", "genderLbl should equal \"Boy\" at app'a launch")
    }
    
    func testShoeTypeValue_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.type, "type should not be nil")
        XCTAssertEqual(sut.type, "City", "type should equal \"City\" at app'a launch")
    }

    func testColorPickerValue_ShouldNotBeNilAndShouldEqualValue() {
        XCTAssertNotNil(sut.color, "color should not be nil")
        XCTAssertEqual(sut.color, "White", "color should equal \"White\" at app'a launch")
    }
    
    func testShoeImage_ShouldNotBeNil() {
        XCTAssertNotNil(sut.shoeSelection.image, "shoeImage should not be nil")
    }
    
    func testOrderResult_ShouldBeEmptyAtLaunch() {
        XCTAssertEqual(sut.orderResult.text, "", "orderResult should be equal to \"\" at app launch")
    }
}
