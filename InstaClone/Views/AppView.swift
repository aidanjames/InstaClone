//
//  AppView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

struct AppView: View {
    
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
        TabView {
            FeedView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("")
                }
            AddContentView()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("")
                }
            AddContentView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("")
                }
        }
        .accentColor(.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(viewModel: FeedViewModel(userName: "aidanjames"))
    }
}
