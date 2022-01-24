//
//  ViewRouter.swift
//  Aiden
//
//  Created by Aiden.Youkhana on 1/23/22.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentItem: TabBarViewModel = .home
    var view: some View {
        return currentItem.view
    }
}

enum TabBarViewModel: Int, CaseIterable {
    case home
    case search
    case notifications
    case account
    
    var imageName: String {
        switch self {
        case .home: return "house.fill"
        case .search: return "magnifyingglass"
        case .notifications: return "bell.fill"
        case .account: return "person.fill"
        }
    }
    
    var view: some View {
        switch self {
        case .home:
            return Text("Home")
        case .search:
            return Text("Search")
        case .notifications:
            return Text("Notifications")
        case .account:
            return Text("Profile")
            
        }
        
    }
    
    
}
