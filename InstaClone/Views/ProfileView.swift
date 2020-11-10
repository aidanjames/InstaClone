//
//  ProfileView.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel(signedOnUsername: "aidanjames")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    SignedOnUserStoryListView(user: viewModel.signedOnUser)
                        .scaleEffect(1.3)
                    Spacer()
                    VStack {
                        Text("\(viewModel.numberOfPosts)").font(.title)
                        Text("Posts")
                    }
                    Spacer()
                    VStack {
                        Text("\(viewModel.numberOfFollowers)").font(.title)
                        Text("Followers")
                    }
                    Spacer()
                    VStack {
                        Text("\(viewModel.numberOfFollowing)").font(.title)
                        Text("Following")
                    }
                    
                }
                .padding(.vertical, 20)
                .padding(.horizontal)
                Button(action: {}) {
                    Text("Edit Profile")
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                        .border(Color.secondary)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Story Highlights")
                        .bold()
                        .font(.caption)
                    Text("Keep your favourite stories on your profile")
                        .font(.caption)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ZStack {
                                Circle()
                                    .stroke(Color.secondary)
                                    .frame(width: 60, height: 60)
                                Button(action: {}) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.primary)
                                }
                            }
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 60, height: 60)
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 60, height: 60)
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 60, height: 60)
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 60, height: 60)
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 60, height: 60)
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 60, height: 60)
                        }
                        .padding(2)
                    }
                    .padding(.top, 10)
                }
                .padding(.leading)
                
               
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        if viewModel.isPrivateProfile {
                            Image(systemName: "lock")
                        }
                        Text(viewModel.signedOnUsername)
                        Image(systemName: "chevron.down").font(.callout)
                    }
                    .font(.title)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {  } ) {
                            Image(systemName: "plus").font(.title)
                        }
                        Button(action: {} ) {
                            Image(systemName: "line.horizontal.3").font(.title)
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
