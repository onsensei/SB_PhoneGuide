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
    
    private let userMobile: UserMobile
    
    public init(userMobile: UserMobile) {
        self.userMobile = userMobile
    }
    
    // MARK: - Property
    
    public var id: Int {
        return userMobile.mobile.id
    }
    
    public var desc: String {
        return userMobile.mobile.description
    }
    
    public var ratingText: String {
        return "Rating: \(userMobile.mobile.rating)"
    }
    
    public var priceText: String {
        return "Price: $\(userMobile.mobile.price)"
    }
    
    public var thumbImageURL: String {
        return userMobile.mobile.thumbImageURL
    }
    
    public var brand: String {
        return userMobile.mobile.brand
    }
    
    public var name: String {
        return userMobile.mobile.name
    }
    
    public var isFavorite: Bool {
        return userMobile.isFavorite
    }
    
    // MARK: - Function
    
    func getUserMobile() -> UserMobile {
        return userMobile
    }
    
    func configureCell(_ cell: MobileTableViewCell, isShowFavorite: Bool) {
        cell.nameLabel.text = name
        cell.descriptionLabel.text = desc
        cell.priceLabel.text = priceText
        cell.ratingLabel.text = ratingText
        
        cell.mobileImageView.sd_setImage(with: URL(string: thumbImageURL), placeholderImage: UIImage(named: "placeholder"))
        
        cell.favoriteButton.isSelected = isFavorite
        cell.favoriteButton.isHidden = !isShowFavorite
    }
    
    func configureDetail(_ vc: MobileDetailViewController) {
        vc.title = name
        vc.descriptionLabel.text = desc
        vc.priceLabel.text = priceText
        vc.ratingLabel.text = ratingText
    }
}
