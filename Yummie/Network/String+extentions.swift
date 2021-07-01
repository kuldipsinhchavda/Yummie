//
//  String+extentions.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 28/06/21.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
