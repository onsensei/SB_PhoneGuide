//
//  ViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 02/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {

    let fullListVC:FullListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fullListVC") as! FullListViewController
    let favoriteListVC:FavoriteListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteListVC") as! FavoriteListViewController
    
    var mobileVMs = [MobileViewModel]()
    
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleInspireColor
        }
        
        // ----------
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        RequestUtil.fetchMobileList(onSuccess: { (result) in
            self.fullListVC.reloadDataSource(mobiles: result)
        }) { (error) in
            //
        }
    }

    // MARK: - ButtonBarPagerTabStripViewController

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [fullListVC, favoriteListVC]
    }
}
