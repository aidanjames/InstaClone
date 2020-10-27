//
//  InstaCloneApp.swift
//  InstaClone
//
//  Created by Aidan Pendlebury on 24/10/2020.
//

import SwiftUI

@main
struct InstaCloneApp: App {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.signedOnUser == nil {
                SignOnPage()
            } else {
                AppView(viewModel: viewModel)
            }
        }
    }
}
