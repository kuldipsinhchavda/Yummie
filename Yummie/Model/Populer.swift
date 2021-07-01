//
//  Populer.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 01/07/21.
//

import Foundation
struct Dish:Decodable {
    
    var id,name, desctiption : String?
    var image : String?
    var calories : Double?
    
    var formettedCalories : String{
        return "\(calories ?? 0) calories"
    }
}
struct order : Decodable {
    
    var id : String?
    var name: String?
    var dish : Dish?
}
