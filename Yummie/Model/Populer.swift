//
//  Populer.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 01/07/21.
//

import Foundation
struct Dish:Codable {
    
    var id,name, description : String?
    var image : String?
    var calories : Double?
    
    
    init(title1: String,image1:String,id1:String,cal: Double, desc: String ) {
        
        self.name = title1
        self.image = image1
        self.id = id1
        self.calories = cal
        self.description = desc
    }
}
struct order : Codable {
    
    var id : String?
    var name: String?
    var dish : Dish?
    
    init(id1: String , name: String , dish: Dish) {
        self.name = name
        self.id = id1
        self.dish = dish
    
       
    }
}
