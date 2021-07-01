//
//  DishCategory.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 01/07/21.
//

import Foundation

struct DishCategory : Codable  {
    var id , title : String
    var image : String
    
    init(title1: String,image1:String,id1:String ) {
        
        self.title = title1
        self.image = image1
        self.id = id1
    }
    
}
