//
//  MobileImageListViewModel.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import ImageSlideshow

class MobileImageListViewModel: NSObject {
    
    private let mobileImages: [MobileImage]
    
    public init(mobileImages: [MobileImage]) {
        self.mobileImages = mobileImages
    }
    
    // MARK: - Function
    
    func configureImageSlideshow(_ slideshow: ImageSlideshow) {
        var imageSources = [SDWebImageSource]()
        
        for mobileImage in mobileImages {
            imageSources.append(SDWebImageSource(url: URL(string: mobileImage.url)!, placeholder: UIImage(named: "placeholder")))
        }
        slideshow.setImageInputs(imageSources)
    }
}
