//
//  xDismissButton.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

struct xDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.secondary)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    xDismissButton()
}
