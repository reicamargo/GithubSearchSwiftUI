//
//  AlertItem.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 07/05/24.
//

import SwiftUI

struct AlertItem {
    let id = UUID()
    var title: String
    var message: Text
    var showAlert: Bool
    var actionButton = Button("OK", role: .cancel) { }
    
    init() {
        title = ""
        message = Text("")
        showAlert = false
    }
    
    mutating func set(title: String, message: String) {
        self.title = title
        self.message = Text(message)
        self.showAlert = true
    }
}
