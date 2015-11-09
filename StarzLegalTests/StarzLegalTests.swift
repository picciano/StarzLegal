//
//  StarzLegalTests.swift
//  StarzLegalTests
//
//  Created by Anthony Picciano on 11/9/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import XCTest
import StarzLegal

class StarzLegalTests: XCTestCase {
    
    func testFAQ() {
        XCTAssertNotNil(FAQ().getFAQ());
    }
    
}
