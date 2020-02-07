//
//  StandingTotalEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class StandingTotalEntity: Mappable {
    var goal_difference: String?
    var points:Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        goal_difference <- map["goal_difference"]
        points <- map["points"]
    }
}
