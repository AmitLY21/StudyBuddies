//
//  ProfileViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 28/05/2022.
//

import UIKit

class ProfilePage: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnPingMe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        profileImage.setRounded()
        Utilities.styleFilledButton(btnPingMe)
    }

    @IBAction func pingMeTapped(_ sender: Any) {
        //TODO open whatsapp with an initial message for this user.
        self.showToast(message: "Ping!", font: .systemFont(ofSize: 18.0))

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
