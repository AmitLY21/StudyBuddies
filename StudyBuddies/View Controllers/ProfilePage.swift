//
//  ProfileViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 28/05/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class ProfilePage: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnPingMe: UIButton!
    
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var lblStudys: UILabel!
    @IBOutlet weak var lblName: UILabel!
    var user : User?
    public var uid : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(uid.isEmpty){
            loadUser(uid: Auth.auth().currentUser!.uid)
        }else{
            loadUser(uid: self.uid)
        }
        
        setUpElements()
    }
    
    func loadUser(uid : String) {
        let db = Firestore.firestore()
        db.collection("users").getDocuments() { (snapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for d in snapshot!.documents {
                        let tempUID = d["uid"] as! String
                        if(tempUID == uid){
                            self.user = User(uid: d["uid"] as! String, name: d["name"] as! String, phonenumber: d["phonenumber"] as! String, userEmail: d["userEmail"] as! String, password: d["password"] as! String, studys: d["studys"] as! String, userBio: d["userBio"] as! String)
                            
                            self.lblName.text = self.user?.name
                            self.lblStudys.text = self.user?.studys
                            self.lblBio.text = self.user?.userBio
                            
                            //print("\(d.documentID) => \(d.data())")
                        }
                    }
                }
        }
    }

    func setUpElements(){
        profileImage.setRounded()
        Utilities.styleFilledButton(btnPingMe)
        lblName.text = user?.name
        lblStudys.text = user?.studys
        lblBio.text = user?.userBio
    }

    //Open whatsapp page
    @IBAction func pingMeTapped(_ sender: Any) {
        //self.showToast(message: "Ping!", font: .systemFont(ofSize: 18.0))
        let phoneNumber =  "\(self.user!.phonenumber)"
        let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }

    }
}

extension UIImageView {
    func setRounded() {
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
    }
}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
