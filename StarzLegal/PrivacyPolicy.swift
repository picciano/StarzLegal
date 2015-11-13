//
//  PrivacyPolicy.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/13/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation
import Alamofire

public let PrivacyPolicyTextDidLoadNotification = "PrivacyPolicyTextDidLoadNotification"
public let PrivacyPolicyHTMLDidLoadNotification = "PrivacyPolicyHTMLDidLoadNotification"
public let PrivacyPolicyTextDidFailToLoadNotification = "PrivacyPolicyTextDidFailToLoadNotification"
public let PrivacyPolicyHTMLDidFailToLoadNotification = "PrivacyPolicyHTMLDidFailToLoadNotification"

public class PrivacyPolicy {
    
    public static let sharedInstance = PrivacyPolicy()
    
    public var privacyPolicyText:String?
    public var privacyPolicyHTML:String?
    
    // Not public, this class is a singleton
    init () {}
    
    public func loadPrivacyPolicyText(completion:(result: String?, error: NSError?) -> Void) {
        if let privacyPolicyText = privacyPolicyText {
            completion(result: privacyPolicyText, error: nil)
            return
        }
        
        Alamofire.request(.GET, "https://assets.starz.com/PLAY/starz/legal/privacypolicy.txt")
            .validate()
            .responseString { response in
                switch response.result {
                case .Success:
                    self.privacyPolicyText = "\(response.result.value)"
                    completion(result: self.privacyPolicyText, error: nil)
                    NSNotificationCenter.defaultCenter().postNotificationName(PrivacyPolicyTextDidLoadNotification, object: self)
                case .Failure(let error):
                    debugPrint(error)
                    completion(result: nil, error: error)
                    NSNotificationCenter.defaultCenter().postNotificationName(PrivacyPolicyTextDidFailToLoadNotification, object: self)
                }
        }
    }
    
    public func loadPrivacyPolicyHTML(completion:(result: String?, error: NSError?) -> Void) {
        if let privacyPolicyHTML = privacyPolicyHTML {
            completion(result: privacyPolicyHTML, error: nil)
            return
        }
        
        Alamofire.request(.GET, "https://assets.starz.com/PLAY/starz/legal/new_privacy.html")
            .validate()
            .responseString { response in
                switch response.result {
                case .Success:
                    self.privacyPolicyHTML = "\(response.result.value)"
                    completion(result: self.privacyPolicyHTML, error: nil)
                    NSNotificationCenter.defaultCenter().postNotificationName(PrivacyPolicyHTMLDidLoadNotification, object: self)
                case .Failure(let error):
                    debugPrint(error)
                    completion(result: nil, error: error)
                    NSNotificationCenter.defaultCenter().postNotificationName(PrivacyPolicyHTMLDidFailToLoadNotification, object: self)
                }
        }
    }
}