//
//  Route.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 28/06/21.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me/"
    case fetchAllCategories
    case temp
    case placeOrder(String)
    case fetchCategoryDishes(String)
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "dish-categories"
        case .temp:
            return "dishes/cat1"
        case .placeOrder(let dishId):
            return "orders/\(dishId)"
        case .fetchCategoryDishes(let catId):
            return "dishes/\(catId)"
        }
    }
}
