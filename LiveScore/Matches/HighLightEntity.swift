//
//  HighLightEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class HighLightEntity: Mappable {
    var fixture_id:Int?
    var event_id:String?
    var player_name:String?
    var type:String?
    var location:String?
    var image:Int?
    var team_name:String?
    var minute:Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        fixture_id <- map["fixture_id"]
        event_id <- map["event_id"]
        player_name <- map["player_name"]
        type <- map["type"]
        location <- map["location"]
        image <- map["image"]
        team_name <- map["team_name"]
        minute <- map["minute"]
    }
}
