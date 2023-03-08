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
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit_AreValuesInitiallyNotNil() {
        XCTAssertNotNil(sut.name, "Name should not be nil.")
        XCTAssertNotNil(sut.typeNumber, "TypeNumber should not be nil.")
        XCTAssertNotNil(sut.type, "Type should not be nil.")
        XCTAssertNotNil(sut.color, "Color should not be nil.")
        XCTAssertNotNil(sut.gender, "Gender should not be nil.")
        XCTAssertNotNil(sut.size, "Size should not be nil.")
    }
    
    func testGenderButton_ShouldUpdateLabelWhenIsOff() {
        _ = sut.genderSwitch.isOn
        sut.genderSwitch.sendActions(for: .valueChanged)
        XCTAssertEqual(sut.genderLbl.text, "Boy")
        
    }

}
