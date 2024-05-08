//
//  LoadingView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground.withAlphaComponent(0.8))
            ProgressView("Loading...")
                .controlSize(.large)
                .tint(.accentColor)
                .offset(.zero)
        }
    }
}

#Preview {
    LoadingView()
}
