//
//  RedditPostView.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import SwiftUI

struct RedditPostView: View {
    let post: RedditPost

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            thumbnail
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 6) {
                header
                title
                Spacer()
                footer
            }
            Spacer()
        }
    }

    // MARK: - Thumbnail

    private var thumbnail: some View {
        AsyncImage(url: post.thumbnailURL) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            placeholder
        }
    }

    private var placeholder: some View {
        ZStack {
            Color(uiColor: .secondarySystemFill)
            Image(systemName: "photo")
        }
    }

    // MARK: - Header
    private var header: some View {
        HStack(spacing: 4) {
            Text("r/\(post.subreddit)")
                .fontWeight(.semibold)
            Text("•")
            Text("u/\(post.author)")
                .foregroundStyle(.secondary)
        }
        .font(.caption)
    }

    // MARK: - Title
    private var title: some View {
        Text(post.title)
            .font(.system(size: 15, weight: .semibold))
            .lineLimit(3)
    }

    // MARK: - Footer
    private var footer: some View {
            HStack(spacing: 8) {
                Text(formattedDate(from: post.created))
                Text("•")
                Text("\(post.numComments) comments")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
    }

    // MARK: - Date

    private func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    VStack {
        RedditPostView(post: .mock())
            .frame(height: 80)
    }
}

