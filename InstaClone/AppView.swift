//
//  AppView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

struct AppView: View {
    
    var body: some View {
        TabView {
            FeedView()
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
                    Image(systemName: "face.smiling")
                    Text("")
                }
        }
        .accentColor(.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
