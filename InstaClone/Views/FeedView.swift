//
//  ContentView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    StoriesListView(viewModel: viewModel)
                    Divider()
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
