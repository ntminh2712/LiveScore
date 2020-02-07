//
//  LineupDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class LineupDetailEntity: Mappable {
    var name: String?
    var data: [LineupGoalkeepersEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        data <- map["data"]
    }
}
