//
//  FavoriteListViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 02/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import XLPagerTabStrip

protocol FavoriteListViewControllerDelegate {
    func favoriteListViewController(_ vc:FavoriteListViewController, didSelectMobileAt index: Int, userMobile: UserMobile)
    func favoriteListViewController(_ vc:FavoriteListViewController, didRemoveFavoriteAt index: Int, userMobile: UserMobile)
}

class FavoriteListViewController: UIViewController, IndicatorInfoProvider, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var mobileTableView: UITableView!
    
    // MARK: - Property
    
    var delegate : FavoriteListViewControllerDelegate?
    var mobileVMs = [MobileViewModel]()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mobileTableView.register(UINib(nibName: "MobileTableViewCell", bundle: nil), forCellReuseIdentifier: "MobileTableViewCell")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Function
    
    func reloadDataSource(userMobiles: [UserMobile]) {
        mobileVMs.removeAll()
        for userMobile in userMobiles {
            if userMobile.isFavorite {
                mobileVMs.append(MobileViewModel(userMobile: userMobile))
            }
        }
        mobileTableView.reloadData()
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Favorite")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileTableViewCell", for: indexPath) as! MobileTableViewCell
        mobileVMs[indexPath.row].configureCell(cell, isShowFavorite: false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if delegate != nil {
            let userMobile = mobileVMs[indexPath.row].getUserMobile()
            delegate?.favoriteListViewController(self, didSelectMobileAt: indexPath.row, userMobile: userMobile)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if delegate != nil {
                let userMobile = mobileVMs[indexPath.row].getUserMobile()
                delegate?.favoriteListViewController(self, didRemoveFavoriteAt: indexPath.row, userMobile: userMobile)
            }
        }
    }
}
