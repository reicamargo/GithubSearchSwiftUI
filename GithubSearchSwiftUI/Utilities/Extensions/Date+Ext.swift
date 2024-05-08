//
//  Date+Ext.swift
//  GithubSearchSwiftUI
//
//  Created by Reinaldo Camargo on 08/05/24.
//

import Foundation

extension Date {
    func convertToDisplayFormat() -> String {
        return formatted(.dateTime.month(.wide).year())
        
    }
}
