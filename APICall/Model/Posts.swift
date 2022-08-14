//
//  Posts.swift
//  APICall
//
//  Created by Macbook on 14.08.22.
//

import Foundation
import SwiftUI

struct Posts: Codable, Hashable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
