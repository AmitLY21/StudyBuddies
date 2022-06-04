//
//  DataManager.swift
//  StudyBuddies
//
//  Created by Amit Levy on 04/06/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class DataManager {
    
    var users = [User]()
    
    init(){
        self.users = getUsers()
    }
    
    func getUsers() -> [User]{
        var users = [User]()
        let db = Firestore.firestore()
        db.collection("users").getDocuments() { (snapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    print("in succsess")
                    for d in snapshot!.documents {
                        
                        let tempUser = User(uid: d["uid"] as! String, name: d["name"] as! String, phonenumber: d["phonenumber"] as! String, userEmail: d["userEmail"] as! String, password: d["password"] as! String, studys: d["studys"] as! String, userBio: d["userBio"] as! String)

                        users.append(tempUser)
                        print("\(d.documentID) => \(d.data())")
                    }
                }
        }
        return users
    }
}
        
//        db.collection("users").getDocuments { snapshot, error in
//            if error == nil {
//                //No error
//                if let snapshot = snapshot {
//                    //Update the users list in the main thread
//                    DispatchQueue.main.async {
//
//                        //Get all documents and create users
//                        self.users = snapshot.documents.map {d in
//
//                            //create user for each document returned
//                            return User(uid: d["uid"] as! String, name: d["name"] as! String, phonenumber: d["phonenumber"] as! String, userEmail: d["userEmail"] as! String, password: d["password"] as! String, studys: d["studys"] as! String, userBio: d["userBio"] as! String)
//                        }
//                    }
//
//                }
//            }else{
//                //handle error
//            }
//        }
    

    
