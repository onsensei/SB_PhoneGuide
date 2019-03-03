//
//  MobileViewModel.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit

class MobileViewModel: NSObject {
    
    private let mobile: Mobile
    
    public init(mobile: Mobile) {
        self.mobile = mobile
    }
    
    public var id: Int {
        return mobile.id
    }
    
    public var desc: String {
        return mobile.description
    }
    
    public var ratingText: String {
        return "Rating: \(mobile.rating)"
    }
    
    public var priceText: String {
        return "Price: $\(mobile.price)"
    }
    
    public var thumbImageURL: String {
        return mobile.thumbImageURL
    }
    
    public var brand: String {
        return mobile.brand
    }
    
    public var name: String {
        return mobile.name
    }
}