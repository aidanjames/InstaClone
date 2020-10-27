//
//  PreviewMockData.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import Foundation

enum PreviewMockData {
    
    static func getSignedOnUser() -> UserProfile {
        var primaryUser = UserProfile(userName: "aidanjames", name: "Aidan Pendleburyt", imageUrl: "primaryProfile")
        
        var celebrity = UserProfile(userName: "therealrock", name: "Rock Johnson", imageUrl: "secondaryProfile")
        
        var aPost = Post(postedBy: celebrity, postType: .photo, postUrl: "pumped")
        aPost.postText = "PUMPED! 🏋🏻"
        aPost.comments.append(PostComment(commentor: primaryUser, comment: "Do you even lift!?"))
        aPost.comments.append(PostComment(commentor: celebrity, comment: "Duuuuuude."))
        aPost.comments.append(PostComment(commentor: primaryUser, comment: "Jk... obvs 🙂"))
        aPost.likedBy.append(primaryUser)
        aPost.likedBy.append(celebrity)
        
        var anotherPost = Post(postedBy: celebrity, postType: .photo, postUrl: "rockDad")
        anotherPost.postText = "This is dad back in the day..."
        
        celebrity.posts.append(aPost)
        celebrity.posts.append(anotherPost)
        
        primaryUser.following.append(celebrity)
        
        return primaryUser
    }
    
}
