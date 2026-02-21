//
//  RedditAppApp.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import SwiftUI
import SwiftData

@main
struct RedditApp: App {
    private let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: RedditPostModel.self)
        } catch {
            fatalError("ModelContainer error: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            RedditListView(viewModel: .instantiate(context: container.mainContext))
        }
    }
}
