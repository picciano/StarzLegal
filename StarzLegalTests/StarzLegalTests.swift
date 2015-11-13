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
                        
                        XCTAssertTrue(question.answer?.rangeOfString("<span>") == nil, "Answer text contains <span> tag.")
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
    
    func testTOSText() {
        let expectation = self.expectationWithDescription("Test TOS text loding")
        
        TermsOfService.sharedInstance.loadTermsOfServiceText { (result, error) -> Void in
            XCTAssertNil(error, "TOS text loading produced error")
            XCTAssertNotNil(result, "TOS text result was nil")
            
            if let result = result {
                debugPrint("Terms of Service: \(result)")
            }
            
            if (error != nil) {
                debugPrint(error)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
    
    func testTOSHTML() {
        let expectation = self.expectationWithDescription("Test TOS HTML loding")
        
        TermsOfService.sharedInstance.loadTermsOfServiceHTML { (result, error) -> Void in
            XCTAssertNil(error, "TOS HTML loading produced error")
            XCTAssertNotNil(result, "TOS HTML result was nil")
            
            if let result = result {
                debugPrint("Terms of Service (HTML): \(result)")
            }
            
            if (error != nil) {
                debugPrint(error)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
    
    func testPPText() {
        let expectation = self.expectationWithDescription("Test PP text loding")
        
        PrivacyPolicy.sharedInstance.loadPrivacyPolicyText { (result, error) -> Void in
            XCTAssertNil(error, "PP text loading produced error")
            XCTAssertNotNil(result, "PP text result was nil")
            
            if let result = result {
                debugPrint("Privacy Policy: \(result)")
            }
            
            if (error != nil) {
                debugPrint(error)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
    
    func testPPHTML() {
        let expectation = self.expectationWithDescription("Test PP HTML loding")
        
        PrivacyPolicy.sharedInstance.loadPrivacyPolicyHTML { (result, error) -> Void in
            XCTAssertNil(error, "PP HTML loading produced error")
            XCTAssertNotNil(result, "PP HTML result was nil")
            
            if let result = result {
                debugPrint("Privacy Policy (HTML): \(result)")
            }
            
            if (error != nil) {
                debugPrint(error)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
    
}
