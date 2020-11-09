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
            VStack {
                Text("Placeholder")
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
