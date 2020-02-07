//
//  TopPlayerTypeEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class TopPlayerTypeEntity: Mappable {
    var position: Int?
    var player_id: Int?
    var team_id: Int?
    var goals: Int?
    var readCards: Int?
    var yellowCards: Int?
    var assists: Int?
    var penalty_goals: Int?
    var team_name: String?
    var image_player: String?
    var fullname: String?
    var image_path: String?
    var country_name: String?
    var player_name:String?
    var number:String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        position <- map["position"]
        player_id <- map["player_id"]
        team_id <- map["team_id"]
        goals <- map["goals"]
        yellowCards <- map["yellowcards"]
        readCards <- map["redcards"]
        assists <- map["assists"]
        penalty_goals <- map["penalty_goals"]
        team_name <- map["team_name"]
        image_player <- map["image_player"]
        fullname <- map["fullname"]
        image_path <- map["image_path"]
        country_name <- map["country_name"]
        player_name <- map["player_name"]
        number <- map["number"]
    }
}
