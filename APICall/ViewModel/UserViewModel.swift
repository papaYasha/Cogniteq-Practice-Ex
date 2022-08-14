//
//  ViewModel.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [Users] = []
    
    func fetchUserInfo() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode([Users].self, from: data)
                DispatchQueue.main.async {
                    self?.users = users
                }
            }
            catch {
                print(String(describing: error))
            }
        }
        task.resume()
    }
}
