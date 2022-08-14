//
//  PostsViewModel.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import Foundation
import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var posts: [Posts] = []
    
    func fetchPostInfo() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Posts].self, from: data)
                DispatchQueue.main.async {
                    self?.posts = posts
                }
            }
            catch {
                print(String(describing: error))
            }
        }
        task.resume()
    }
}
