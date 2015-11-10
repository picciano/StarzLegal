//
//  Category.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/10/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation

public class QuestionCategory {
    public var categoryId:String?
    public var name:String?
    public var v:Int?
    public var position:Int?
    
    public init(dictionary: NSDictionary?) {
        if let dictionary = dictionary {
            categoryId = dictionary["_id"] as! String?
            name = dictionary["name"] as! String?
            v = dictionary["__v"] as! Int?
            position = dictionary["position"] as! Int?
        }
    }
}