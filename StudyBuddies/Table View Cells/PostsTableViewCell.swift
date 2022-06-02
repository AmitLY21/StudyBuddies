//
//  PostsTableViewCell.swift
//  StudyBuddies
//
//  Created by Amit Levy on 02/06/2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
