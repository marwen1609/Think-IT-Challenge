//
//  RoomsTableViewCell.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/26/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var devicesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roomImageView.layer.cornerRadius = 8
        roomImageView.clipsToBounds = true
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 1.0
        containerView.clipsToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
