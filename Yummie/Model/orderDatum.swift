//
//  orderDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 1, 2021

import Foundation

struct orderDatum : Codable {

        let dish : orderDish?
        let id : String?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case dish = "dish"
                case id = "id"
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
            dish = try orderDish(from: decoder)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }

}
