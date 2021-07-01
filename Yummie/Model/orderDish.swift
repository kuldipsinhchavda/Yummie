//
//  orderDish.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 1, 2021

import Foundation

struct orderDish : Codable {

        let calories : Int?
        let category : String?
        let descriptionField : String?
        let id : String?
        let image : String?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case calories = "calories"
                case category = "category"
                case descriptionField = "description"
                case id = "id"
                case image = "image"
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                calories = try values.decodeIfPresent(Int.self, forKey: .calories)
                category = try values.decodeIfPresent(String.self, forKey: .category)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                image = try values.decodeIfPresent(String.self, forKey: .image)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }

}
