//
//  PostsContentView.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import SwiftUI

struct PostsContentView: View {
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
            List {
                ForEach(viewModel.posts, id: \.self) { post in
                    HStack {
                        VStack(spacing: 10) {
                            Text(post.title)
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                            Text(post.body)
                                .font(Font.custom("Helvetica", size: 16))
                                .foregroundColor(.gray)
                            Text("\(post.id)")
                                .font(Font.custom("Helvetica", size: 25))
                                .foregroundColor(.red)
                        }
                    }
                    .padding(10)
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPostInfo()
            }
        }
    }

struct PostsContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsContentView()
    }
}
