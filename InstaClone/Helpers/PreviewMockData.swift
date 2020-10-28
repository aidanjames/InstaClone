//
//  PreviewMockData.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 27/10/2020.
//

import SwiftUI

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
        
        let storyPost = Post(postedBy: celebrity, postType: .story, postUrl: "")
        
        celebrity.posts.append(aPost)
        celebrity.posts.append(anotherPost)
        celebrity.posts.append(storyPost)
        
        primaryUser.following.append(celebrity)
        
        return primaryUser
    }
    
    static func returnTinyProfileImage() -> some View {
        return Image("primaryProfile").resizable().scaledToFit().frame(width: 10, height: 10)
    }
    
}
