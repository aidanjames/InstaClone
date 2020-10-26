//
//  ContentView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

struct FeedView: View {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Extract this out as 'StoriesView'
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1...20, id: \.self) { story in
                            VStack(spacing: 5) {
                                Circle()
                                    .frame(width: 50, height: 50)
                                Text("Name\(story)")
                                    .font(.caption)
                            }
                            .padding(5)
                        }
                    }
                    .frame(height: 100)
                    .padding(.leading, 8)
                    .padding(.vertical, 15)
                }
                // Extract this out as 'PostsView'
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(1...20, id: \.self) { post in
                        VStack {
                            HStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                Text("jonnyboi13")
                                    .font(.footnote)
                                    .bold()
                                    Spacer()
                            }
                            .padding(.leading, 10)
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 450)
                                .foregroundColor(.secondary)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                HStack(spacing: 18) {
                                    Image(systemName: "heart")
                                    Image(systemName: "bubble.right")
                                    Image(systemName: "paperplane")
                                    Spacer()
                                    Image(systemName: "bookmark")
                                        .padding(.horizontal, 15)
                                }
                                .font(.title2)
                                .padding(.vertical, 7)
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("731 Likes")
                                        .bold()
                                    HStack(alignment: .bottom, spacing: 3) {
                                        Text("jonnyboi13")
                                            .bold()
                                        Text("This one is my personal fav 😄")
                                    }
                                    Text("View all 21 comments")
                                        .foregroundColor(.secondary)
                                    HStack(alignment: .bottom, spacing: 3) {
                                        Text("tabbitxx")
                                            .bold()
                                        Text("It sux bro!")
                                    }
                                    Text("25 minutes ago")
                                        .foregroundColor(.secondary)
                                }
                                .font(.footnote)
                            }
                            .padding(.leading, 10)
                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Instagram")
                        .font(.title)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .font(.title)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "camera")
                        .font(.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
