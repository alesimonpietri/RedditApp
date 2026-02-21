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
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.posts) { post in
                    RedditPostView(post: post)
                        .onAppear {
                            Task { await viewModel.fetchNextPage(post: post) }
                        }
                }

                if viewModel.isLoadingMore {
                    ProgressView()
                }
            }.padding(.horizontal, 16)
        }
        .task {
            await viewModel.fetchInitalPage()
        }
        .refreshable {
            await viewModel.fetchInitalPage()
        }
    }
}

#Preview {
    RedditListView(viewModel: .mock())
}
