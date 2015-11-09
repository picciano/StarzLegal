//
//  FAQ.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/9/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation

public class FAQ {
    
    public init () {}
    
    public func getFAQ() -> NSArray? {
        
        let path = NSBundle(forClass: self.self.dynamicType).pathForResource("appletv_starz_play_faq", ofType: "json")
        let data = NSData.init(contentsOfFile: path!);
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
            return json
            
        }
        catch let error as NSError {
            print(error)
        }
        
        return nil
    }
    
}
