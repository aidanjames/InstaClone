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
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        SignedOnUserImageView(user: viewModel.signedOnUser)
                            .scaleEffect(1.3)
                        Spacer()
                        VStack {
                            Text("\(viewModel.numberOfPosts)").font(.headline)
                            Text("Posts").foregroundColor(.secondary)
                        }
                        .font(.subheadline)
                        .scaleEffect(1.1)
                        Spacer()
                        VStack {
                            Text("\(viewModel.numberOfFollowers)").font(.headline)
                            Text("Followers").foregroundColor(.secondary)
                        }
                        .font(.subheadline)
                        .scaleEffect(1.1)
                        Spacer()
                        VStack {
                            Text("\(viewModel.numberOfFollowing)").font(.headline)
                            Text("Following").foregroundColor(.secondary)
                        }
                        .font(.subheadline)
                        .scaleEffect(1.1)
                        
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
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(Color.secondary)
                                            .frame(width: 60, height: 60)
                                        Button(action: {}) {
                                            Image(systemName: "plus")
                                                .foregroundColor(.primary)
                                        }
                                    }
                                    Text("New")
                                }
                                VStack {
                                    Circle()
                                        .fill(Color.secondary)
                                        .frame(width: 60, height: 60)
                                    Text(" ")
                                }
                                VStack {
                                    Circle()
                                        .fill(Color.secondary)
                                        .frame(width: 60, height: 60)
                                    Text(" ")
                                }
                                VStack {
                                    Circle()
                                        .fill(Color.secondary)
                                        .frame(width: 60, height: 60)
                                    Text(" ")
                                }
                                VStack {
                                    Circle()
                                        .fill(Color.secondary)
                                        .frame(width: 60, height: 60)
                                    Text(" ")
                                }
                                VStack {
                                    Circle()
                                        .fill(Color.secondary)
                                        .frame(width: 60, height: 60)
                                    Text(" ")
                                }
                                VStack {
                                    Circle()
                                        .fill(Color.secondary)
                                        .frame(width: 60, height: 60)
                                    Text(" ")
                                }
                            }
                            .font(.caption)
                            .padding(2)
                        }
                        .padding(.top, 10)
                    }
                    .padding(.leading)
                    
                    HStack {
                        Spacer()
                        Image(systemName: "squareshape.split.3x3")
                            .foregroundColor(.primary)
                        Spacer()
                        Spacer()
                        Image(systemName: "person.crop.square")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .font(.title)
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Rectangle()
                            Rectangle().opacity(0)
                        }
                        .frame(height: 2)
                        GridProfileView(posts: DataUniverse.shared.fetchPostsForSignedOnUser(viewModel.signedOnUser))
                    }
                    
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
