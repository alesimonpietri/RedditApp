//
//  RedditListView.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import SwiftUI

struct RedditListView: View {
    @State var viewModel: RedditListViewModel

    var body: some View {
        List(viewModel.posts) { post in
            Text(post.title)
        }.task {
            await viewModel.fetchPost()
        }
    }
}

#Preview {
    RedditListView(viewModel: .mock())
}
