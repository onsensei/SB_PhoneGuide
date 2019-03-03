//
//  UserMobile.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit

class UserMobile: NSObject {
    var mobile: Mobile
    var isFavorite: Bool
    
    init(mobile: Mobile, isFavorite: Bool) {
        self.mobile = mobile
        self.isFavorite = isFavorite
    }
}
