//
//  ContentView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: FeedViewModel
    
//    init() {
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//    }
    
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
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.getPostsForFeed()) { post in
                        PostListView(post: post)
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
        FeedView(viewModel: FeedViewModel())
    }
}
