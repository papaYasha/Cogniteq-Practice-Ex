//
//  ContentView.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var users: [Users] = []
    
    func fetch() {
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

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
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
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
