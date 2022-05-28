//
//  ViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 28/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        //Style the elements
        Utilities.styleHollowButton(loginBtn)
        Utilities.styleFilledButton(signUpBtn)
        logoImage.setRounded()
        
    }
}
