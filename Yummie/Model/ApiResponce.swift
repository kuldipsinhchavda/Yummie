//
//  ApiResponce.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 01/07/21.
//

import Foundation

struct ApiResponsec<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
