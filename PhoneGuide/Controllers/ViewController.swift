//
//  ViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 02/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController, FullListViewControllerDelegate {

    // MARK: - Property
    
    let fullListVC:FullListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fullListVC") as! FullListViewController
    let favoriteListVC:FavoriteListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteListVC") as! FavoriteListViewController
    
    var mobiles = [Mobile]()
    
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    
    // MARK: - UIViewController
    
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
        fullListVC.delegate = self
        
        RequestUtil.fetchMobileList(onSuccess: { (result) in
            self.mobiles = result
            self.fullListVC.reloadDataSource(mobiles: result)
        }) { (error) in
            //
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "mainVC_to_mobileDetailVC") {
            let mobileDetailVC:MobileDetailViewController = segue.destination as! MobileDetailViewController
            mobileDetailVC.mobile = sender as? Mobile
        }
    }
    
    // MARK: - ButtonBarPagerTabStripViewController

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [fullListVC, favoriteListVC]
    }
    
    // MARK: - FullListViewControllerDelegate
    
    func didSelectMobileAt(index: Int) {
        self.performSegue(withIdentifier: "mainVC_to_mobileDetailVC", sender: mobiles[index])
    }
}
