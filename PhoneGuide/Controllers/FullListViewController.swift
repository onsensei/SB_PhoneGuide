//
//  FullListViewController.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 02/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit
import XLPagerTabStrip

protocol FullListViewControllerDelegate {
    func fullListViewController(_ vc:FullListViewController, didSelectMobileAt index: Int)
    func fullListViewController(_ vc:FullListViewController, didPressFavoriteButtonAt index: Int)
}

class FullListViewController: UIViewController, IndicatorInfoProvider, UITableViewDataSource, UITableViewDelegate, MobileTableViewCellDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mobileTableView: UITableView!
    
    // MARK: - Property
    
    var delegate : FullListViewControllerDelegate?
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
            mobileVMs.append(MobileViewModel(userMobile: userMobile))
        }
        mobileTableView.reloadData()
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "All")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileTableViewCell", for: indexPath) as! MobileTableViewCell
        cell.delegate = self
        mobileVMs[indexPath.row].configureCell(cell, isShowFavorite: true)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if delegate != nil {
            delegate?.fullListViewController(self, didSelectMobileAt: indexPath.row)
        }
    }
    
    // MARK: - MobileTableViewCellDelegate
    
    func mobileTableViewCell(_ cell: MobileTableViewCell, didPressFavoriteButtonAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.fullListViewController(self, didPressFavoriteButtonAt: indexPath.row)
        }
    }
}
