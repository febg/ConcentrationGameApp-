//
//  Card.swift
//  Concentrartion
//
//  Created by Felipe Ballesteros on 2018-02-24.
//  Copyright © 2018 FBApps. All rights reserved.
//

import Foundation

struct Card {
    var faceUp: Bool = false
    var isMatch: Bool = false
    var identifier: Int
    
    static var idRecord = 0;
    
    static func getId() -> Int {
        idRecord = idRecord + 1
        return idRecord
    }
    
    init() {
        self.identifier = Card.getId()
    }
    
}
