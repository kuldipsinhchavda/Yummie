//
//  ApiRespoce.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 28/06/21.
//

import Foundation

struct apiResponce<T:Decodable>:Decodable {
    
    let status : Int?
    let message : String?
    let data : T?
    let error : String?
}
