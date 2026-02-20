//
//  RedditListView.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import SwiftUI

struct RedditListView: View {

    private struct Layout {
        static let rowInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    }

    @State var viewModel: RedditListViewModel

    var body: some View {
        List(viewModel.posts) { post in
            RedditPostView(post: post)
                .listRowInsets(Layout.rowInsets)
                .listRowSeparator(.hidden)
        }.task {
            await viewModel.fetchPost()
        }
        .listStyle(.plain)
    }
}

#Preview {
    RedditListView(viewModel: .mock())
}
