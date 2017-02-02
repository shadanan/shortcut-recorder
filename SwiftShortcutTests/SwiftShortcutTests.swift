//
//  SwiftShortcutTests.swift
//  SwiftShortcutTests
//
//  Created by Shad Sharma on 12/23/16.
//  Copyright © 2016 Shad Sharma. All rights reserved.
//

import Carbon

import XCTest
@testable import SwiftShortcut

class SwiftShortcutTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPrintGlyph() {
        print("\(UnicodeScalar(kControlUnicode)!)")
        print("\(UnicodeScalar(0x23CF)!)")
        print("\u{23CF}")
        print("\u{F70F}")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
