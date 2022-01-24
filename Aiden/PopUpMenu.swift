//
//  PopUpMenu.swift
//  Aiden
//
//  Created by Aiden.Youkhana on 1/23/22.
//

import SwiftUI
import Foundation
import UIKit

struct PopUpMenu: View {
    var body: some View {
        HStack (spacing: 24){
            Spacer ()
            ForEach(MenuViewModel.allCases, id: \.self) {
                item in MenuItem(viewModel: item)
            }
            Spacer ()
            
        }
        .transition(.scale)
    }
}

enum MenuViewModel: Int, CaseIterable {
    case share
    case save
    case add
    case download
    
    var imageName: String {
        switch self {
        case .share: return "paperplane.fill"
        case .save: return "bookmark.fill"
        case .add: return "plus.rectangle.fill.on.rectangle.fill"
        case .download: return "square.and.arrow.down.fill"
        }
    }
    
    var title: String {
        switch self {
        case .share: return "Share"
        case .save: return "Save"
        case .add: return "Add"
        case .download: return "Download"
        }
    }

    
    
}

struct MenuItem: View {
    let viewModel: MenuViewModel
    let dimention: CGFloat = 33
    
    var body: some View {
        VStack (alignment: .center, spacing: 12){
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: 60, height: 60)
                    .shadow(radius: 4)
                
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: dimention, height: dimention)
                    .foregroundColor(Color(.white))
            }
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.footnote)
        }
    }
    
}

struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}
