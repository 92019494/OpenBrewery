//
//  BreweryTableViewCell.swift
//  OpenBrewery
//
//  Created by Anthony on 10/09/19.
//  Copyright © 2019 EmeraldApps. All rights reserved.
//

import UIKit

class BreweryTableViewCell: UITableViewCell {
    
    // cell title labels
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var website: UILabel!
    
    
    // brewery instance labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    var titleSize: CGFloat = 20.0
    var detailSize: CGFloat = 17.0
    
    var titleFont = "Futura-Bold"

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // setting fonts
        name.font = UIFont(name: titleFont, size: titleSize)
        street.font = UIFont(name: titleFont, size: titleSize)
        city.font = UIFont(name: titleFont, size: titleSize)
        state.font = UIFont(name: titleFont, size: titleSize)
        country.font = UIFont(name: titleFont, size: titleSize)
        phone.font = UIFont(name: titleFont, size: titleSize)
        name.font = UIFont(name: titleFont, size: titleSize)
        website.font = UIFont(name: titleFont, size: titleSize)
        
        nameLabel.font = UIFont(name: titleFont, size: detailSize)
        streetLabel.font = UIFont(name: titleFont, size: detailSize)
        cityLabel.font = UIFont(name: titleFont, size: detailSize)
        stateLabel.font = UIFont(name: titleFont, size: detailSize)
        countryLabel.font = UIFont(name: titleFont, size: detailSize)
        phoneNumberLabel.font = UIFont(name: titleFont, size: detailSize)
        websiteLabel.font = UIFont(name: titleFont, size: detailSize)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
