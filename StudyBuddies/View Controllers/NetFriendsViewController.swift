//
//  NetFriendsViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 29/05/2022.
//

import UIKit
import FirebaseFirestore

class NetFriendsViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var netFriendsTableView: UITableView!
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        //register the cell template i created to the table view
        let nib = UINib(nibName: "UserTableViewCell" , bundle: nil)
        netFriendsTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        netFriendsTableView.delegate = self
        netFriendsTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //showToast(message: "Launch \(users[indexPath.row].name) Profile", font: UIFont.systemFont(ofSize: 14))
        
        //Switch to a specific profile page
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "profile") as! ProfilePage
        destination.uid = users[indexPath.row].uid
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //assign a cell from the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell" , for: indexPath) as! UserTableViewCell
        
        //editing the cell details
        cell.profileImage.setRounded()
        cell.profileNameLBL.text = users[indexPath.row].name
        cell.profileDescLBL.text = users[indexPath.row].studys
        cell.profilePhonenumberLBL.text = users[indexPath.row].phonenumber
        
        return cell
    }
    
    //fetch all users from the firestore db
    func loadData(){
        let db = Firestore.firestore().collection("users")
        db.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else {
                    return
                }
                for d in snap.documents {
                    let tempUser = User(uid: d["uid"] as! String, name: d["name"] as! String, phonenumber: d["phonenumber"] as! String, userEmail: d["userEmail"] as! String, password: d["password"] as! String, studys: d["studys"] as! String, userBio: d["userBio"] as! String)
                    self.users.append(tempUser)
                    //print(d.data())
                }
                DispatchQueue.main.async {
                     self.netFriendsTableView.reloadData()
                 }
            }
        }
    }
}
