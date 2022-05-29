//
//  NetFriendsViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 29/05/2022.
//

import UIKit

class NetFriendsViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var netFriendsTableView: UITableView!
    //TODO add datamanager class that reads data from firestore and assign it to an array of users
    //from the users array we will take the user details!
    //Temp array for show
    let users = ["Amit" , "Alon" , "Eyal" , "Moshe"]
    override func viewDidLoad() {
        super.viewDidLoad()

        //register the cell template i created to the table view
        let nib = UINib(nibName: "UserTableViewCell" , bundle: nil)
        netFriendsTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        netFriendsTableView.delegate = self
        netFriendsTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    //TODO open specific user profile page / open whatsapp page with there number
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showToast(message: "tapped \(users[indexPath.row])", font: UIFont.systemFont(ofSize: 14))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //assign a cell from the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell" , for: indexPath) as! UserTableViewCell
        
        //editing the cell details
        cell.profileImage.setRounded()
        cell.profileNameLBL.text = users[indexPath.row]
        cell.profileDescLBL.text = "Computer Science"
        var phone :String = "054-5454\(Int.random(in: 0...999))"
        cell.profilePhonenumberLBL.text = phone
        
        return cell
    }
    
}
