//
//  LineupGoalkeepersEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class LineupGoalkeepersEntity: Mappable {
    var position_id: Int?
    var number: Int?
    var captain: String?
    var common_name: String?
    var image_path: String?
    var country_name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        position_id <- map["position_id"]
        number <- map["number"]
        captain <- map["captain"]
        common_name <- map["common_name"]
        image_path <- map["image_path"]
        country_name <- map["country_name"]
    }
}
