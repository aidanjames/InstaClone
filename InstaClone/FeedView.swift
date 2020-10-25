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
                ScrollView(showsIndicators: false) {
                    ForEach(1...20, id: \.self) { post in
                        VStack {
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 450)
                                .foregroundColor(.secondary)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "heart")
                                    Image(systemName: "bubble.right")
                                    Image(systemName: "paperplane")
                                    Spacer()
                                    Image(systemName: "bookmark")
                                        .padding(.horizontal, 8)
                                }
                                .font(.headline)
                                .padding(.top, 5)
                                VStack(alignment: .leading, spacing: 5) {
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

                                }
                                .font(.caption)
                            }
                            .padding(.leading, 10)
                            
                        }
                    }
                }
                .frame(height: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Instagram")
                        .font(.title)
                }
                ToolbarItem {
                    Image(systemName: "paperplane")
                        .font(.title)
                }
                ToolbarItem(placement: .navigation) {
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
