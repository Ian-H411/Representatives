//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Ian Hall on 8/14/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    var toBeSent: [Representative]?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statecell", for: indexPath)
        cell.textLabel?.text = States.all[indexPath.row]
        return cell
    }
    func getRepresentatives(state: String){
        RepresentativeController.searchRepresentatives(state: state) { (representative) in
            self.toBeSent = representative
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "todetail", sender: self)
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let state = States.all[indexPath.row]
        getRepresentatives(state: state)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard toBeSent != nil else {return}
        if segue.identifier == "todetail"{
                if let toDetailVC = segue.destination as? DetailTableViewController{
                    
                    toDetailVC.landingPad = toBeSent
            
            }
        }
    }


}
