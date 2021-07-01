//
//  CardView.swift
//  Yummie
//
//  Created by Bharat Kakadiya on 23/06/21.
//

import UIKit

class cardView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        intialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        intialSetup()
    }
    private func intialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        cornerRadius = 10
    }
}
