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
        let expectation = self.expectationWithDescription("Test FAQ loding")
        
        FAQ.sharedInstance.loadFAQs { (result, error) -> Void in
            XCTAssertNil(error, "FAQ loading produced error")
            XCTAssertNotNil(result, "FAQ result was nil")
            
            if let result = result {
                for section in result {
                    debugPrint("Section name: \(section.name!)")
                    
                    for question in section.questions! {
                        debugPrint("Question: \(question.question!)")
                        debugPrint("Answer: \(question.answer!)")
                        debugPrint("Number of related questions: \(question.relatedQuestions?.count)")
                    }
                }
            }
            
            if (error != nil) {
                debugPrint(error)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
    
}
