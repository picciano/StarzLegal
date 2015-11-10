//
//  Question.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/10/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation

public class Question {
    public var questionId:String?
    public var answer:String?
    public var question:String?
    public var relatedQuestions:Array<Question>?
    public var category:QuestionCategory?
    public var order:Int?
    
    public init(dictionary: NSDictionary?) {
        if let dictionary = dictionary {
            questionId = dictionary["questionId"] as! String?
            answer = dictionary["answer"] as! String?
            question = dictionary["question"] as! String?
            relatedQuestions = [Question]()
            category = QuestionCategory(dictionary: dictionary["category"] as? NSDictionary)
            order = dictionary["order"] as! Int?
        }
    }
}