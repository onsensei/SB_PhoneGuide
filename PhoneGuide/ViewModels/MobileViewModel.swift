//
//  MobileViewModel.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import SDWebImage

class MobileViewModel: NSObject {
    
    private let mobile: Mobile
    
    public init(mobile: Mobile) {
        self.mobile = mobile
    }
    
    // MARK: - Property
    
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
    
    // MARK: - Function
    
    func configureCell(_ cell: MobileTableViewCell) {
        cell.nameLabel.text = name
        cell.descriptionLabel.text = desc
        cell.priceLabel.text = priceText
        cell.ratingLabel.text = ratingText
        
        cell.mobileImageView.sd_setImage(with: URL(string: thumbImageURL), placeholderImage: UIImage(named: "placeholder"))
    }
    
    func configureDetail(_ vc: MobileDetailViewController) {
        vc.title = name
        vc.descriptionLabel.text = desc
        vc.priceLabel.text = priceText
        vc.ratingLabel.text = ratingText
    }
}
