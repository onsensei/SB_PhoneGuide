//
//  FavoriteListViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 02/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class FavoriteListViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var mobileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Favorite")
    }
}
