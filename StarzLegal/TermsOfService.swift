//
//  TermsOfService.swift
//  StarzLegal
//
//  Created by Anthony Picciano on 11/13/15.
//  Copyright © 2015 Anthony Picciano. All rights reserved.
//

import Foundation
import Alamofire

public let TermsOfServiceTextDidLoadNotification = "TermsOfServiceTextDidLoadNotification"
public let TermsOfServiceHTMLDidLoadNotification = "TermsOfServiceHTMLDidLoadNotification"
public let TermsOfServiceTextDidFailToLoadNotification = "TermsOfServiceTextDidFailToLoadNotification"
public let TermsOfServiceHTMLDidFailToLoadNotification = "TermsOfServiceHTMLDidFailToLoadNotification"

public class TermsOfService {
    
    public static let sharedInstance = TermsOfService()
    
    public var termsOfServiceText:String?
    public var termsOfServiceHTML:String?
    
    // Not public, this class is a singleton
    init () {}
    
    public func loadTermsOfServiceText(completion:(result: String?, error: NSError?) -> Void) {
        if let termsOfServiceText = termsOfServiceText {
            completion(result: termsOfServiceText, error: nil)
            return
        }
        
        Alamofire.request(.GET, "https://assets.starz.com/PLAY/starz/legal/termsofuse.txt")
            .validate()
            .responseString { response in
                switch response.result {
                case .Success:
                    self.termsOfServiceText = "\(response.result.value)"
                    completion(result: self.termsOfServiceText, error: nil)
                    NSNotificationCenter.defaultCenter().postNotificationName(TermsOfServiceTextDidLoadNotification, object: self)
                case .Failure(let error):
                    debugPrint(error)
                    completion(result: nil, error: error)
                    NSNotificationCenter.defaultCenter().postNotificationName(TermsOfServiceTextDidFailToLoadNotification, object: self)
                }
        }
    }
    
    public func loadTermsOfServiceHTML(completion:(result: String?, error: NSError?) -> Void) {
        if let termsOfServiceHTML = termsOfServiceHTML {
            completion(result: termsOfServiceHTML, error: nil)
            return
        }
        
        Alamofire.request(.GET, "https://assets.starz.com/PLAY/starz/legal/new_terms.html")
            .validate()
            .responseString { response in
                switch response.result {
                case .Success:
                    self.termsOfServiceHTML = "\(response.result.value)"
                    completion(result: self.termsOfServiceHTML, error: nil)
                    NSNotificationCenter.defaultCenter().postNotificationName(TermsOfServiceHTMLDidLoadNotification, object: self)
                case .Failure(let error):
                    debugPrint(error)
                    completion(result: nil, error: error)
                    NSNotificationCenter.defaultCenter().postNotificationName(TermsOfServiceHTMLDidFailToLoadNotification, object: self)
                }
        }
    }
}