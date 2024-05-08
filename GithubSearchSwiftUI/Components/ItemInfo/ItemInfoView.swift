//
//  ItemInfoView.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import SwiftUI

struct ItemInfoView: View {
    var viewModel: ItemInfoViewModel
    
    var body: some View {
        VStack {
            Label(viewModel.title, systemImage: viewModel.systemImage)
                .foregroundStyle(.primary)
            Text(viewModel.count)
        }
    }
}

#Preview {
    ItemInfoView(viewModel: ItemInfoViewModel(infoType: .gists, count: 12))
}
