//
//  FAQ.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/9/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation
import Alamofire

public class FAQ {
    
    public static let sharedInstance = FAQ()
    
    public var faqs:AnyObject?
    
    // Not public, this class is a singleton
    init () {}
    
    public func loadFAQs(completion:(result: AnyObject?, error: NSError?) -> Void) {
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
                    self.faqs = response.result.value
                    completion(result: self.faqs, error: nil)
                case .Failure(let error):
                    debugPrint(error)
                    completion(result: nil, error: error)
                }
        }
    }
}
