//
//  AllDishes.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 29/06/21.
//

import Foundation

struct AllDishes : Decodable {
    
    var categoryDish : [DishCategory]?
    var populer : [Dish]?
    var chif : [Dish]?
}
