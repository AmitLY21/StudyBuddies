//
//  Objects.swift
//  StudyBuddies
//
//  Created by Amit Levy on 04/06/2022.
//

import Foundation


struct User {
    var uid : String
    var name : String
    var phonenumber : String
    var userEmail : String
    var password : String
    var studys : String
    var userBio : String
    
}

struct Post{
    var createdByUID : String //uid
    var uploadDate : String
    var postInfo : String
}
