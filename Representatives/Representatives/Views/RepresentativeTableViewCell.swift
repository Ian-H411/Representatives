//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Ian Hall on 8/14/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit


class RepresentativeTableViewCell: UITableViewCell {
    //MARK: - outlets
    var representative: Representative?{
        didSet{
            update()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var partyLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var districtLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var officeLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    
    func update(){
        guard let representative = representative else {return}
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        stateLabel.text = representative.state
        districtLabel.text = representative.district
        phoneLabel.text = representative.phone
        officeLabel.text = representative.office
        linkLabel.text = representative.link
    }
}
