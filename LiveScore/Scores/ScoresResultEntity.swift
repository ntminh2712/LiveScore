//
//  ScoresResultEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ScoresResultEntity: Mappable {
    var total_leagues: Int = 0
    var data: [ScoresDataEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        total_leagues <- map["total_leagues"]
        data <- map["data"]
    }
}
