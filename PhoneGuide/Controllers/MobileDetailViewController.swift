//
//  MobileDetailViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit

class MobileDetailViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Property
    
    var mobile:Mobile?
    var mobileVM:MobileViewModel?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mobileVM = MobileViewModel(mobile: mobile!)
        mobileVM?.configureDetail(self)
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
