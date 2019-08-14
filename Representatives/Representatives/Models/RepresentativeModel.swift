//
//  RepresentativeModel.swift
//  Representatives
//
//  Created by Ian Hall on 8/14/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//&output=json

import Foundation

struct Representative: Codable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String

}
