//
//  MatchesEventsEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesEventsEntity: Mappable {
    var id: Int?
    var team_id: Int?
    var type:String?
    var player_id:Int?
    var player_name:String?
    var related_player_id:Int?
    var related_player_name:String?
    var is_localteam: Bool? = false
    var minute:Int?
    var extra_minute:String?
    var reason:String?
    var injuried:String?
    var result:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        team_id <- map["team_id"]
        type <- map["type"]
        player_id <- map["player_id"]
        player_name <- map["player_name"]
        related_player_id <- map["related_player_id"]
        is_localteam <- map["is_localteam"]
        related_player_name <- map["related_player_name"]
        minute <- map["minute"]
        extra_minute <- map["extra_minute"]
        reason <- map["reason"]
        injuried <- map["message"]
        result <- map["result"]
    }
}
