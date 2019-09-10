//
//  Brewery.swift
//  OpenBrewery
//
//  Created by Anthony on 10/09/19.
//  Copyright © 2019 EmeraldApps. All rights reserved.
//

import Foundation

struct Brewery: Decodable {
    
    var name:String
    var street:String
    var city:String
    var state:String
    var country:String
    var phone:String
    var website_url:String
    
    init(name:String, street:String, city:String, state:String, country: String, phone:String, website_url:String){
        
        self.name = name
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.phone = phone
        self.website_url = website_url
    }
}
