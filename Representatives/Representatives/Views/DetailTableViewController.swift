//
//  DetailTableViewController.swift
//  Representatives
//
//  Created by Ian Hall on 8/14/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var landingPad:[Representative]?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let representatives = landingPad else {return 0}
        return representatives.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativecell", for: indexPath) as? RepresentativeTableViewCell else {return UITableViewCell()}
        guard let representaives = landingPad else {return UITableViewCell()}
        let rep = representaives[indexPath.row]
        
        cell.representative = rep

        

  

        return cell
    }
   

  
}
