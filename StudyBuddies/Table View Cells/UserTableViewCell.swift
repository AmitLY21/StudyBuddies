//
//  UserTableViewCell.swift
//  StudyBuddies
//
//  Created by Amit Levy on 29/05/2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLBL: UILabel!
    @IBOutlet weak var profileDescLBL: UILabel!
    @IBOutlet weak var profilePhonenumberLBL: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
