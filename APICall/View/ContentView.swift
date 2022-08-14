//
//  ContentView.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.self) { user in
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(user.username)
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                            Text(user.website)
                                .font(Font.custom("Helvetica", size: 20))
                                .foregroundColor(.gray)
                            Text(user.address.street)
                                .font(Font.custom("Helvetica", size: 20))
                                .foregroundColor(.red)
                            Text(user.address.geo.lat)
                                .font(Font.custom("Helvetica", size: 20))
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(10)
                }
                NavigationLink(
                    destination: PostsContentView(),
                    label: {
                        Text("Posts ⏭")
                            .foregroundColor(Color.blue)
                            .font(Font.custom("Helvetica", size: 24))
                    })
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUserInfo()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
