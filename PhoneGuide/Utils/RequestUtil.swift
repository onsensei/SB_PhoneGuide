//
//  RequestUtil.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 02/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import Alamofire

let config = [
    "baseUrl": [
        "main": "https://scb-test-mobile.herokuapp.com"
    ],
    "path": [
        "mobiles": "/api/mobiles/"
    ]
]

class RequestUtil: NSObject {
    static func fetchMobileList(onSuccess: @escaping (_ result: [Mobile]) -> Void, onFailure: @escaping (_ error: Error) -> Void) -> Void {
        let baseUrl:String = config["baseUrl"]!["main"]!
        let path:String = config["path"]!["mobiles"]!
        guard let url = URL(string: "\(baseUrl)\(path)") else {
            return;
        }

        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isSuccess {
                let json:Any = response.result.value!
                var result = [Mobile]()
                
                for item in json as! [Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: item, options: .prettyPrinted)
                        let jsonString = String(data: jsonData, encoding: .utf8)
                        let data = jsonString?.data(using: .utf8)
                        let jsonDecoder = JSONDecoder()
                        let mobile = try jsonDecoder.decode(Mobile.self, from: data!)
                        result.append(mobile)
                    } catch {
                        //
                    }
                }
                
                onSuccess(result)
            } else if response.result.isFailure {
                let error:Error = response.result.error!
                onFailure(error)
            }
        }
    }
    
    static func fetchMobileImageList(mobileId: Int, onSuccess: @escaping (_ result: [MobileImage]) -> Void, onFailure: @escaping (_ error: Error) -> Void) -> Void {
        let baseUrl:String = config["baseUrl"]!["main"]!
        let path:String = config["path"]!["mobiles"]!
        guard let url = URL(string: "\(baseUrl)\(path)\(mobileId)/images/") else {
            return;
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isSuccess {
                let json:Any = response.result.value!
                var result = [MobileImage]()
                
                for item in json as! [Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: item, options: .prettyPrinted)
                        let jsonString = String(data: jsonData, encoding: .utf8)
                        let data = jsonString?.data(using: .utf8)
                        let jsonDecoder = JSONDecoder()
                        let mobileImage = try jsonDecoder.decode(MobileImage.self, from: data!)
                        result.append(mobileImage)
                    } catch {
                        //
                    }
                }
                
                onSuccess(result)
            } else if response.result.isFailure {
                let error:Error = response.result.error!
                onFailure(error)
            }
        }
    }
}
