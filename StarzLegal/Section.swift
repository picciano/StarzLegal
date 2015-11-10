//
//  Section.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/10/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation

public class Section {
    public var sectionId:String?
    public var name:String?
    public var v:Int?
    public var position:Int?
    public var questions:Array<Question>?
    
    public init(dictionary: NSDictionary?) {
        if let dictionary = dictionary {
            sectionId = dictionary["_id"] as! String?
            name = dictionary["name"] as! String?
            v = dictionary["__v"] as! Int?
            position = dictionary["position"] as! Int?
            questions = [Question]()
            
            if let items = dictionary["questions"] as! NSArray? {
                for dictionary in items {
                    questions!.append(Question(dictionary: dictionary as? NSDictionary))
                }
            }
        }
    }
}
