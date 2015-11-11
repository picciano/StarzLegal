//
//  FAQ.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/9/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation
import Alamofire

public let FAQsDidLoadNotification = "FAQsDidLoadNotification"

public class FAQ {
    
    public static let sharedInstance = FAQ()
    
    public var faqs:Array<Section>?
    
    // Not public, this class is a singleton
    init () {}
    
    public func loadFAQs(completion:(result: Array<Section>?, error: NSError?) -> Void) {
        if let faqs = faqs {
            completion(result: faqs, error: nil)
            return
        }
        
        Alamofire.request(.GET, "https://assets.starz.com/PLAY/starz/faq/firetv_starz_play_faq.json")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    debugPrint("Validation Successful")
                    self.faqs = [Section]()
                    
                    if let items = response.result.value as! NSArray? {
                        for dictionary in items {
                            self.faqs?.append(Section(dictionary: dictionary as? NSDictionary))
                        }
                    }
                    
                    self.assignRelatedQuestions()
                    
                    completion(result: self.faqs, error: nil)
                    NSNotificationCenter.defaultCenter().postNotificationName(FAQsDidLoadNotification, object: self)
                case .Failure(let error):
                    debugPrint(error)
                    completion(result: nil, error: error)
                }
        }
    }
    
    func assignRelatedQuestions() {
        if let faqs = self.faqs {
            for section in faqs {
                for question in section.questions! {
                    for relatedQuestionId in question.relatedQuestionIds! {
                        if let relatedQuestion = self.question(relatedQuestionId) {
                            question.relatedQuestions?.append(relatedQuestion)
                        }
                    }
                }
            }
        }
    }
    
    func question(questionId: String) -> Question? {
        if let faqs = self.faqs {
            for section in faqs {
                for question in section.questions! {
                    if questionId == question.questionId {
                        return question
                    }
                }
            }
        }
        
        return nil
    }
}
