//
//  MobileImage.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit

struct MobileImage: Codable {
    var url: String
    var id: Int
    var mobileId: Int
    
    enum CodingKeys: String, CodingKey {
        case url
        case id
        case mobileId = "mobile_id"
    }
}
