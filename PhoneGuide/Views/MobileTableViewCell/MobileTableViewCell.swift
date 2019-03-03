//
//  MobileTableViewCell.swift
//  PhoneGuide
//
//  Created by Thanaphat Suwannikornkul on 03/03/62 BE.
//  Copyright © 2562 Thanaphat Suwannikornkul. All rights reserved.
//

import UIKit

protocol MobileTableViewCellDelegate {
    func mobileTableViewCell(_ cell: MobileTableViewCell, didPressFavoriteButtonAt indexPath: IndexPath)
}

class MobileTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mobileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: - Property
    
    var delegate : MobileTableViewCellDelegate?
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBAction
    
    @IBAction func onPressFavoriteButton(_ sender: Any) {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView")
            return
        }
        
        let indexPath = superView.indexPath(for: self)
        if delegate != nil {
            delegate?.mobileTableViewCell(self, didPressFavoriteButtonAt: indexPath!)
        }
    }
}
