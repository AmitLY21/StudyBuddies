//
//  UploadPostViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 02/06/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class UploadPostViewController: UIViewController {

    @IBOutlet weak var uploadBTN: UIButton!
    @IBOutlet weak var postInfoText: UITextView!
    @IBOutlet weak var titleLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleFilledButton(uploadBTN)
    }
    
    @IBAction func uploadPost(_ sender: Any) {
        if(postInfoText.hasText){
            let db = Firestore.firestore()
            db.collection("posts").addDocument(
                data:["postInfo":postInfoText.text! , "createdByUID" : Auth.auth().currentUser?.uid , "uploadDate": getTimeStampDateString(Date.now)]) { (error) in
                if error != nil {
                    // Show error message
                    print("Error in DB")
                }
            }
        
            showToast(message: "Post uploaded!", font: UIFont.systemFont(ofSize: 14))
            postInfoText.text = "Enter text here..."
        }else{
            showToast(message: "Empty post!", font: UIFont.systemFont(ofSize: 14))
        }
    }
    
    func getTimeStampDateString(_ uploadDate : Date) -> String {
            let date = uploadDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            let strDate = dateFormatter.string(from: date)
            return strDate
        }
}
