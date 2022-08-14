//
//  UsersInfo.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import Foundation
import SwiftUI

struct Users: Codable, Hashable {
    var id : Int
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
}

struct Address: Codable, Hashable {
    var street: String
    var city: String
    var geo: Geo
}

struct Geo: Codable, Hashable {
    var lat: String
    var lng: String
}
