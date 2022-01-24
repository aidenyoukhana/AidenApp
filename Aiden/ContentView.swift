//
//  ContentView.swift
//  Aiden
//
//  Created by Aiden.Youkhana on 1/22/22.
//

import SwiftUI

struct ContentView: View {
    @ State private var showMenu = false
    @ObservedObject var router = ViewRouter()
    var body: some View {
        ZStack (alignment: .bottom){
            VStack {
                Spacer()
                router.view
                Spacer()
                HStack {
                    TabIcon(viewModel: .home, router: router)
                    TabIcon(viewModel: .search, router: router)
                    TabMenueIcon(showMenu: $showMenu)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    TabIcon(viewModel: .notifications, router: router)
                    TabIcon(viewModel: .account, router: router)
                }
                .frame(height: UIScreen.main.bounds.height / 10)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
            }
            if showMenu {
                PopUpMenu()
                    .padding(.bottom, 144)
            }
        }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
    }
}

struct TabMenueIcon: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .shadow(radius: 4)
            
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundColor(Color(.systemBlue))
                .rotationEffect(Angle(degrees: showMenu ? 225 : 0))
        }
        .offset(y: -44)
    }
}


//Custom icon tab menue
struct TabIcon: View {
    let viewModel: TabBarViewModel
    @ObservedObject var router: ViewRouter
    var body: some View {
        Button {
            router.currentItem = viewModel
        } label: {
            Image(systemName: viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
    }
}

//Content view model
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(router: ViewRouter())
    }
}


