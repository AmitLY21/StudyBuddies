//
//  NewsFeedViewController.swift
//  StudyBuddies
//
//  Created by Amit Levy on 02/06/2022.
//

import UIKit

class NewsFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var NewsFeedTableView: UITableView!
    
    @IBOutlet weak var uploadPost: UIButton!
    
    var news:[String] = ["Peace Among Users" , "Happy Birthday!" , "Hello there folks! Searching for a partner in iOS Development Course." , "Searching for a study buddy in Hedva 1! Cookies on me ;)" , "Looking for a senior to teach me Design Patterns."]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(uploadPost)
        let nib = UINib(nibName: "PostsTableViewCell" , bundle: nil)
        NewsFeedTableView.register(nib, forCellReuseIdentifier: "PostsTableViewCell")
        NewsFeedTableView.delegate = self
        NewsFeedTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsFeedTableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell

        cell.profileImage.setRounded()
        cell.profileName.text = "Israel Israeli"
        cell.postDate.text = "\(getTimeStampDateString())"
        cell.postInfo.text = news[indexPath.row]
        
        return cell;
    }
    
    //TODO Move to user profile page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showToast(message: "You tapped \(indexPath.row)", font: UIFont.systemFont(ofSize: 14))
    }
    
    func getTimeStampDateString() -> String {
            let date = Date.now
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            let strDate = dateFormatter.string(from: date)
            return strDate
        }

}
