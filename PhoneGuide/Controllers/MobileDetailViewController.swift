//
//  MobileDetailViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import ImageSlideshow

class MobileDetailViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Property
    
    var mobile:Mobile?
    var mobileVM:MobileViewModel?
    var mobileImageListVM:MobileImageListViewModel?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mobileVM = MobileViewModel(mobile: mobile!)
        mobileVM?.configureDetail(self)
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageIndicator
        slideshow.activityIndicator = DefaultActivityIndicator()
        
        RequestUtil.fetchMobileImageList(mobileId: (mobile?.id)!, onSuccess: { (result) in
            self.mobileImageListVM = MobileImageListViewModel(mobileImages: result)
            self.mobileImageListVM?.configureImageSlideshow(self.slideshow)
        }) { (error) in
            //
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
