//
//  UploadPostViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 02/06/2022.
//

import UIKit

class UploadPostViewController: UIViewController {

    @IBOutlet weak var uploadBTN: UIButton!
    @IBOutlet weak var postInfoText: UITextView!
    @IBOutlet weak var titleLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleFilledButton(uploadBTN)
    }
    
    //TODO Upload post
    @IBAction func uploadPost(_ sender: Any) {
        if(postInfoText.hasText){
            showToast(message: "Uploaded Post!", font: UIFont.systemFont(ofSize: 14))
            postInfoText.text = "Enter text here..."
        }else{
            showToast(message: "Empty post!", font: UIFont.systemFont(ofSize: 14))
        }
    }
    
}
